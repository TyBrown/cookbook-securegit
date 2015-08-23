actions :checkout, :export, :sync, :delete
default_action :sync

attribute :name, :name_attribute => true
attribute :additional_remotes, :kind_of => Hash
attribute :checkout_branch, :kind_of => String
attribute :depth, :kind_of => Integer
attribute :destination, :kind_of => String, :required => true
attribute :enable_checkout, :kind_of => [TrueClass, FalseClass]
attribute :enable_submodules, :kind_of => [TrueClass, FalseClass]
attribute :environment, :kind_of => Hash
attribute :group, :kind_of => [String, Integer], :default => "root"
attribute :reference, :kind_of => String
attribute :remote, :kind_of => String
attribute :repository, :kind_of => String, :required => true
attribute :revision, :kind_of => String, :default => "release"
attribute :user, :kind_of => [String, Integer], :default => "root"
attribute :private_key, :kind_of => String
attribute :private_key_file, :kind_of => String
attribute :timeout, :kind_of => Integer
