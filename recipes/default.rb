 
# add google chrome to repository
apt_repository 'chrome' do
  uri node['chrome']['apt_uri']
  distribution 'stable'
  components %w(main)
  key node['chrome']['apt_key']
  action :nothing
end.run_action(:add)

# Install google chrome
package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)

# Install component for screengun
['gnome-core', 'xfce4', 'vnc4server', 'imagemagick'].each do |pkg|
  package pkg
end

["#{node['screengun']['install_path']}", "#{node['screengun']['image_path']}"].each do |dir_create|
  directory "#{dir_create}" do
    owner node['screengun']['user']
    group node['screengun']['user']
    mode '0771'
    action :create
  end
end

template "#{node['screengun']['install_path']}/screengun.sh" do
  source 'screengun.sh.erb'
  owner node['screengun']['user']
  group node['screengun']['user']
  mode '0770'
  variables(
     path: node['screengun']['image_path']
  )
end

template "#{node['screengun']['install_path']}/screenshot_list" do
  source 'url_list.txt.erb'
  owner node['screengun']['user']
  group node['screengun']['user']
  mode '0660'
end