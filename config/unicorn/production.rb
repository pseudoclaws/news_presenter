app_dir = "/app"

working_directory app_dir

pid "#{app_dir}/tmp/unicorn.pid"

# stderr_path "#{app_dir}/log/unicorn.stderr.log"
# stdout_path "#{app_dir}/log/unicorn.stdout.log"

worker_processes 5
listen 3000, :backlog => 64 #"/tmp/unicorn.sock"
timeout 30