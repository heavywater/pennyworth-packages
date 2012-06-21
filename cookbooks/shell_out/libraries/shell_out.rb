class Chef
  module Mixin
    module ShellOut
      alias :shell_out :old_shell_out
      def shell_out(*command_args)
        cmd = Mixlib::ShellOut.new(*run_command_compatible_options(command_args))
        # Plz spam my non-tty sessions when chef isn't daemonized.
        if !Chef::Config[:daemon] && Chef::Log.debug?
          cmd.live_stream = STDOUT
        end
        cmd.run_command
        cmd
      end
    end
  end
end
