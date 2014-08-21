# Set the working application directory
# # working_directory "/path/to/your/app"
@dir = "/var/www/dashing/wunderstatus/"

working_directory @dir

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{@dir}tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "#{@dir}log/unicorn.log"
stdout_path "#{@dir}log/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.wrdashing.sock", :backlog => 64

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
