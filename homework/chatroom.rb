require "socket"

class ChatMaster
  TCP_PORT = 9876
  def initialize
    @q = Queue.new
    @host = TCPServer.open(TCP_PORT)
    @users = {}
    start
    super
  end

  def do_action(user, payload)
    case payload[:action]
    when "user"
      register_as user, payload[:params]
    when "bye"
      kickof user
    end
  end

  def register_as(user, name)
    if name.nil?
      user.socket.puts "You didn't specify a user name"
      puts "Registering user #{user} #{name.nil?}"
      return
    end
    if @users.keys.include? name
      user.socket.puts "User '#{name}' has already been taken"
    else
      user.name = name
      @users[name] = user
      user.socket.puts "You're now known as '#{name}'"
    end
  end

  def kickof(user)
    user.socket.close
    @users.delete user.name
  end

  def start
    writter = Thread::start do
      loop do
        who, msg = @q.pop
        puts "A client sent: #{msg.class}"
        if msg.class == String
          payload = /^\/(?<action>user|bye)( +(?<params>\w*))?/.match(msg.strip)
          if !payload.nil?
             do_action(who, payload)
             next
          end
          if who.name.nil?
            who.socket.puts "You aren't registered yet, please do '/user yourname'"
            next
          end
          @users.each do |name, u|
            if u.id != who.id
              u.socket.puts "[#{who.name}] #{msg}"
            end
          end
        end

      end
    end

    loop do
      Thread.new(@host.accept, @q) do |socket, q|
        usr = ChatUser.new(socket, q)
        
        socket.puts "Wellcome!\n"
        socket.puts "Please register using '/user yourname'"
        socket.puts "To leave the chat, write '/bye'"

        q << [self, usr]
        usr.start

      end
    end
  end
end

class ChatUser
  attr_accessor :q, :master_q, :socket, :id, :name
  @@ids = 0
  def initialize(socket, master_q)
    @@ids += 1
    @id = @@ids
    @master_q = master_q
    @socket = socket
    @name = nil
  end

  def start
    loop do
      msg = @socket.gets
      @master_q << [self, msg]
    end
  end

  def register
    
  end
end

chat_room = ChatMaster.new
