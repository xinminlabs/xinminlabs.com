set :application, "wecapslabs.com"
set :repository,  "."

set :scm, :none
set :deploy_via, :copy
set :copy_compression, :zip
set :use_sudo, false
set :keep_releases, 5

role :web, "wecapslabs.com"
role :app, "wecapslabs.com"

set :user, "huangzhi"
set :group, user

set :deploy_to, "/home/huangzhi/sites/wecapslabs.com/production"

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end
end
