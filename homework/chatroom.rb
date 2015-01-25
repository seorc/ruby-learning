require "socket"

class ChatMaster
  TCP_PORT = 9876
  def initialize
    @q = Queue.new
    @host = TCPServer.open(TCP_PORT)
    @users = []
    start
    super
  end

  def do_action(usr, action)
    puts "Executed action #{aciton}"
  end

  def start
    writter = Thread::start do
      loop do
        who, msg = @q.pop
        puts "A client sent: #{msg.class}"
        if msg.class == String
          #action = /^\/(?<action>user|bye)( (?<params>\w*))?/.match(msg.strip)
          #  action = /^\/(?<action>user|bye)/.match(msg.strip)
          # if true || !action.nil?
          #   do_action(who, "hoohoho") #action[:action])
          # end
            @users.each do |u|
              if u.id != who
                u.socket.puts "[#{who}] #{msg}"
              end
            end
          #end
        elsif msg.class == ChatUser
          @users << msg
        end

      end
    end
    loop do
      Thread.new(@host.accept, @q) do |socket, q|
        usr = ChatUser.new(socket, q)
        
        socket.puts "Wellcome!\n"
        socket.puts "You've been registered with ID #{usr.id}"

        q << [self, usr]
        usr.start

      end
    end
  end
end

class ChatUser
  attr_accessor :q, :master_q, :socket, :id
  @@ids = 0
  def initialize(socket, master_q)
    @master_q = master_q
    @socket = socket
    @@ids += 1
    @id = @@ids
  end

  def start
    loop do
      msg = @socket.gets
      @master_q << [@id, msg]
    end
  end

  def register
    
  end
end

chat_room = ChatMaster.new
