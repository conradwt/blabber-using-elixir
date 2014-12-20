defmodule Blabber do
  
  def start do
    spawn( __MODULE__, :loop, [1] )
  end
  
  def loop( count ) do
    receive do
      :done -> IO.puts( "Closing" )
              :ok
    after 
      2000 -> IO.puts( "Loop #{node()} with #{count} says hello" )
              Blabber.loop( count + 1 ) 
    end
  end

end
