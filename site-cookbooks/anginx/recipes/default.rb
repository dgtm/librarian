%w(public logs).each do |dir|
  directory "#{node.anginx.web_dir}/#{dir}" do
    owner node.user.name
    mode "0755"
    recursive true
  end
end

template "#{node.nginx.dir}/sites-available/#{node.anginx.app}.conf" do
  source "nginx.conf.erb"
  mode "0644"
end

nginx_site "#{node.anginx.app}.conf"

cookbook_file "#{node.anginx.web_dir}/public/index.html" do
  source "index.html"
  mode 0755
  owner node.user.name
end
