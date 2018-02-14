Blabber Using Elixir
====================

The purpose of this step by step tutorial is to provide a very simple example of hot code loading and communicating between Erlang processes using the Elixir Language.  This example was based on an awesome video presentation by Bryan Hunter and you can watch the very same video which inspired me to create this repository.

## Requirements

- Elixir 1.6.1 or higher

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/elixir). (Tag 'elixir')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/elixir).
- If you **found a bug**, [open an issue](https://github.com/conradwt/blabber-using-elixir/issues).
- If you **have a feature request**, [open an issue](https://github.com/conradwt/blabber-using-elixir/issues).
- If you **want to contribute**, submit a pull request.

## Let's Code!!!

1.  Open a new terminal

2.  Create a new Elixir project

    ```
    $ mix new blabber
    $ cd blabber
    ```

3.  Modify the file blabber.ex located in the lib directory to look like the
    following:

    ```elixir
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
    ```

4.  In the terminal, compile the project:

    ```
    $ mix compile
    ```

5.  Open the compiled module inside the Elixir Interactove Shell (iex):

    ```
    $ iex -S mix
    ```

6.  Now, let's run the application:

    ```
    iex> pid = Blabber.start()
    ```

    Note:  We are saving the pid so that we will have a reference to the running
           process in order to stop it.

7.  Let's change the running application without stopping the running process by modifying Blabber.ex as follows in the editor of your choice:

    Change:

    ```
    hello
    ```

    to

    ```
    howdy!!!
    ```

8.  Recompile our application within the Elixir Interactove Shell (iex):

    ```
    iex> c("lib/blabber.ex")
    ```

    Note:  You should now see the "howdy!!!" being displayed within the running
           process. Very cool!!!

9.  Now, let's stop the process:

    iex > send(pid, :done)

10. Exit Elixir Interactove Shell (iex) by typing the following on your keyboard:

    ```
    Control-C
    Control-C
    ```

11. In a terminal, create a named node called "dog" using Elixir Interactove Shell (iex) command:

    ```
    $ iex --sname dog
    ```

12. Load and compile the Blabber module:

    ```
    iex> c("lib/blabbler.ex")
    ```

13. Run the application:

    ```
    iex> pid = Blabber.start()
    ```

14. In a new terminal, create a named node called "bird" using Elixir Interactove Shell (iex) command:

    ```
    $ iex --sname bird
    ```

15. Let's ping the node named "dog" from the "bird node":

    ```
    iex> :net_adm.ping( :"dog@your_machine_name" )
    ```

    Note:  your_machine_name here will be different.  Just replace the above with
           the appropriate name.

16. Switch to the terminal where we are running the "dog" node and list all the
    nodes that we can see:

    ```
    iex> Node.list()
    ```

    Note:  This should display something similar to the following:

    ```
    [:"bird@your_machine_name"]
    ```

17. Switch to the terminal where we are running the "bird" node and list all the
    nodes that we can see:

    ```
    iex> Node.list()
    ```

    Note:  This should display something similar to the following:

    ```
    [:"dog@your_machine_name"]
    ```

18. In the "dog" node terminal, execute the following with Elixir Interactive Shell (iex) to load the Blabber module within all nodes on our local area network (LAN):

    ```
    iex> :c.nl(Blabber)
    ```

19. In the "bird" node terminal, let's execute the Blabber's start function:

    ```
    iex> pid = Blabber.start()
    ```

    Note:  You should see this executing within the terminal for the "bird" node.  If
           we didn't perform step (18), it would generate an error message similar
           to the following:

           ```elixir
           ** (UndefinedFunctionError) undefined function: Blabber.start/0 (module Blabber is not available)
               Blabber.start()
           ```

20. Now, change blabbler.ex as follows with the text editor of your choosing by doing the following:

    Change

    ```
    howdy
    ```

    to

    ```
    hey
    ```

    Note:  Please don't forget to save the file.

21. In the "dog" node terminal, compile the module and broadcast the changes to the other nodes on your local
    area network:

    ```
    iex> c("lib/blabber.ex")
    iex> :c.nl(Blabber)
    ```

    Note:  You should see "hey" being displayed within the execution of both "dog" and "bird" nodes.  Very very
           cool stuff and please give yourself a pat on the back for completing this tutorial.

## References

* [Bryan Hunter: Erlang: a jump-start for .NET developers](https://vimeo.com/68327403)

* [Elixir Language](http://elixir-lang.org)

## Support

Bug reports and feature requests can be filed for the cassandra-example-using-rails project here:

* [File Bug Reports and Features](https://github.com/conradwt/Blabber-using-elixir/issues)

## Contact

Follow Conrad Taylor on Twitter ([@conradwt](https://twitter.com/conradwt))

## Creator

- [Conrad Taylor](http://github.com/conradwt) ([@conradwt](https://twitter.com/conradwt))

## License

This repository is released under the [MIT License](http://www.opensource.org/licenses/MIT).

## Copyright

&copy; Copyright 2014 - 2018 Conrad Taylor. All Rights Reserved.
