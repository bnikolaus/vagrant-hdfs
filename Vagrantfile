# Example 7
#
# Pulling out all the stops with cluster of seven Vagrant boxes.
#
domain   = 'test.com'

nodes = [
  { :hostname => 'master',  :ip => '10.10.10.42', :box => 'precise64', :ram => 512 },
  { :hostname => 'slave01', :ip => '10.10.10.43', :box => 'precise64' },
#  { :hostname => 'datanode2', :ip => '192.168.0.44', :box => 'precise64' },
#  { :hostname => 'datanode3', :ip => '192.168.0.45', :box => 'precise64' },
#  { :hostname => 'datanode4', :ip => '192.168.0.46', :box => 'precise64' },
#  { :hostname => 'datanode5', :ip => '192.168.0.47', :box => 'precise64' },
]

Vagrant::Config.run do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.host_name = node[:hostname] + '.' + domain
      node_config.vm.network :hostonly, node[:ip]

      memory = node[:ram] ? node[:ram] : 256;
      node_config.vm.customize [
        'modifyvm', :id,
        '--name', node[:hostname],
        '--memory', memory.to_s
      ]
    end
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'modules'
  end
  
  # config.vm.provision :shell, :path => "test.sh"
end
