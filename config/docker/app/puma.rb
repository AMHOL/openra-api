# frozen_string_literal: true

workers 1

threads_count = 5
threads(threads_count, threads_count)

bind 'unix:///usr/src/app/tmp/sockets/puma.sock'
pidfile '/usr/src/app/tmp/pids/puma.pid'

daemonize false

preload_app!

environment ENV.fetch('RACK_ENV', 'production')
