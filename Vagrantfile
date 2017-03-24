# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    # Useful when something bad happens
    # vb.gui = true
  end

  config.vm.define :comicdb do |node|
    node.vm.box = "http://download.opensuse.org/vagrant/openSUSE-42.1-virtualbox-x86_64-1.0.1.box"
    node.vm.box_check_update = true
    node.vm.hostname = "comicdb.test.lan"
    node.vm.network :private_network, ip: "192.168.1.2", virtualbox__intnet: true
    node.vm.network "forwarded_port", guest: 80, host: 5000

    node.vm.provision "shell", inline: <<EOS
zypper -n in tcpdump

zypper -n in apache2-devel \
  gcc \
  gcc-c++ \
  git-core \
  libcurl-devel \
  libmysqlclient-devel \
  libopenssl-devel \
  libstdc++-devel \
  libxml2-devel \
  libxslt-devel \
  make \
  mariadb \
  nodejs \
  patch \
  ruby2.1-devel \
  sqlite3-devel \
  ruby2.1-rubygem-bundler \
  zlib-devel

zypper ar -f http://download.opensuse.org/repositories/devel:/openQA/openSUSE_Leap_42.1/devel:openQA.repo 
zypper --gpg-auto-import-keys ref

zypper -n in phantomjs

systemctl enable mysql
systemctl start mysql

cd /vagrant
bundle config build.nokogiri --use-system-libraries
bundle install --retry=3
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

sudo gem install passenger -v 5.0.7
passenger-install-apache2-module.ruby2.1 -a

cp /vagrant/vagrant/conf/comickeeper/sysconfig_apache2 /etc/sysconfig/apache2
cp /vagrant/vagrant/conf/comickeeper/httpd.conf.local /etc/apache2/httpd.conf.local
cp /vagrant/vagrant/conf/comickeeper/comickeeper.test.lan.conf /etc/apache2/vhosts.d/

systemctl enable apache2
systemctl start apache2
EOS
  end
end
