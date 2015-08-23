use_inline_resources

action :sync do

  template "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper" do
    cookbook "securegit"
    source "sshwrapper.erb"
    action :create
    mode 00740
    user new_resource.user
    group new_resource.group
    if new_resource.private_key
      variables  ( {:keyfile => "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key"} )
    else
      variables ( {:keyfile => new_resource.private_key_file} )
    end
  end

  if new_resource.private_key
    file "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key" do
      if new_resource.private_key
        content new_resource.private_key
      else
        source new_resource.private_key_file
      end
      action :create
      mode 00600
      user new_resource.user
      group new_resource.group
      sensitive  true
    end
  end

  git new_resource.destination do
    repository new_resource.repository
    revision new_resource.revision
    user new_resource.user
    group new_resource.group
    ssh_wrapper "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper"
    action :sync
    additional_remotes new_resource.additional_remotes
    checkout_branch new_resource.checkout_branch
    depth new_resource.depth
    enable_checkout new_resource.enable_checkout
    enable_submodules new_resource.enable_submodules
    environment new_resource.environment
    provider new_resource.provider
    reference new_resource.reference
    remote new_resource.remote
    timeout new_resource.timeout
  end

end


action :checkout do

  template "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper" do
    cookbook "securegit"
    source "sshwrapper.erb"
    action :create
    mode 00740
    user new_resource.user
    group new_resource.group
    if new_resource.private_key
      variables  ( {:keyfile => "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key"} )
    else
      variables ( {:keyfile => new_resource.private_key_file} )
    end
  end

  if new_resource.private_key
    file "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key" do
      if new_resource.private_key
        content new_resource.private_key
      else
        source new_resource.private_key_file
      end
      action :create
      mode 00600
      user new_resource.user
      group new_resource.group
      sensitive  true
    end
  end

  git new_resource.destination do
    repository new_resource.repository
    revision new_resource.revision
    user new_resource.user
    group new_resource.group
    ssh_wrapper "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper"
    action :checkout
    additional_remotes new_resource.additional_remotes
    checkout_branch new_resource.checkout_branch
    depth new_resource.depth
    enable_checkout new_resource.enable_checkout
    enable_submodules new_resource.enable_submodules
    environment new_resource.environment
    provider new_resource.provider
    reference new_resource.reference
    remote new_resource.remote
    timeout new_resource.timeout
  end

end


action :export do

  template "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper" do
    cookbook "securegit"
    source "sshwrapper.erb"
    action :create
    mode 00740
    user new_resource.user
    group new_resource.group
    if new_resource.private_key
      variables  ( {:keyfile => "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key"} )
    else
      variables ( {:keyfile => new_resource.private_key_file} )
    end
  end

  if new_resource.private_key
    file "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key" do
      if new_resource.private_key
        content new_resource.private_key
      else
        source new_resource.private_key_file
      end
      action :create
      mode 00600
      user new_resource.user
      group new_resource.group
      sensitive  true
    end
  end

  git new_resource.destination do
    repository new_resource.repository
    revision new_resource.revision
    user new_resource.user
    group new_resource.group
    ssh_wrapper "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper"
    action :export
    additional_remotes new_resource.additional_remotes
    checkout_branch new_resource.checkout_branch
    depth new_resource.depth
    enable_checkout new_resource.enable_checkout
    enable_submodules new_resource.enable_submodules
    environment new_resource.environment
    provider new_resource.provider
    reference new_resource.reference
    remote new_resource.remote
    timeout new_resource.timeout
  end

end


action :delete do

  template "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.sshwrapper" do
    cookbook "securegit"
    source "sshwrapper.erb"
    action :delete
    variables  ( {:keyfile => "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key"} )
  end

  file "#{Pathname("#{new_resource.destination}").dirname.to_s}/.#{new_resource.name}.private_key" do
    action :delete
    mode 00600
    user new_resource.user
    group new_resource.group
  end

  directory new_resource.destination do
    action :delete
    recursive true
  end

end
