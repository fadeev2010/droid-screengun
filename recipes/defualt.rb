 
['gnome-core', 'xfce4', 'firefox', 'vnc4server', 'xdotool', 'wmctrl'].each do |pkg|
  package pkg
end

template '/data/pa_app_user/app/shared' do
  source 'screengun.sh'
end

template '/data/pa_app_user/app/shared' do
  source 'url_list.txt'
end