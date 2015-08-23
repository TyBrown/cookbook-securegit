=====================================================
securegit
=====================================================

A `resource <http://docs.chef.io/resource.html>`_ defines the desired state for a single configuration item present on a node that is under management by chef. A resource collection---one (or more) individual resources---defines the desired state for the entire node. During a `chef-client run <http://docs.chef.io/chef_client.html#the-chef-client-title-run>`_, the current state of each resource is tested, after which the chef-client will take any steps that are necessary to repair the node and bring it back into the desired state.

Use the securegit resource to manage source control resources that exist in a private git repository. This is a LWRP that used the scp_git resource to achieve the git related tasks, substituting certain attributes where necessary.


Syntax
=====================================================
A securegit resource block manages source control resources that exist in a private git repository:

.. code-block:: ruby

   securegit 'app_name' do
     destination '/path/to/app_name'
     repository 'node[:app_name][:git_repository]'
     revision 'node[:app_name][:git_revision]'
     private_key_file '/path/to/private_key_file'
     action :sync
   end

The full syntax for all of the properties that are available to the securegit resource is:

.. code-block:: ruby

   git 'name' do
     additional_remotes         Hash
     checkout_branch            String
     depth                      Integer
     destination                String # Required
     enable_checkout            TrueClass, FalseClass
     enable_submodules          TrueClass, FalseClass
     environment                Hash
     group                      String, Integer
     notifies                   # see description
     private_key                String
     private_key_file           String
     reference                  String
     remote                     String
     repository                 String
     revision                   String
     subscribes                 # see description
     timeout                    Integer
     user                       String, Integer
     action                     Symbol # defaults to :sync if not specified
   end

where

* ``securegit`` is the resource
* ``name`` is the name of the resource block
* ``destination`` is teh location in which the source files will be placed and/or synchronized with the files under source control management
* ``:action`` identifies the steps the chef client will take to bring the node into the desired state
* ``additional_remotes``, ``checkout_branch``, ``depth``, ``destination``, ``enable_checkout``, ``enable_submodules``, ``environment``, ``group``, ``reference``, ``remote``, ``repository``, ``revision``, ``timeout``, and ``user`` are properties of this resource, with the ruby type shown. 

Actions
=====================================================
This resource has the following actions:

.. list-table::
   :widths: 150 450
   :header-rows: 1

   * - Action
     - Description
   * - ``:checkout``
     - Clone or check out the source. When a checkout is available, this provider does nothing.
   * - ``:export``
     - Export the source, excluding or removing any version control artifacts.
   * - ``:nothing``
     - Define a resource block that does nothing until it is notified by another resource to take action. When notified, this resource block is either run immediately or it is queued up to be run at the end of the chef-client run.
   * - ``:sync``
     - Default. Update the source to the specified version, or get a new clone or checkout.
   * - ``:delete``
     - Delete the source, as well as any additional helper files required for enabling this securegit resource.

Properties
=====================================================
This resource has the following properties:

.. list-table::
   :widths: 150 450
   :header-rows: 1

   * - Property
     - Description
   * - ``additional_remotes``
     - **Ruby Type:** Hash

       See Git resource documentation.
   * - ``checkout_branch``
     - **Ruby Type:** String

       See Git resource documentation.
   * - ``depth``
     - **Ruby Type:** Integer

       See Git resource documentation.
   * - ``destination``
     - **Ruby Type:** String

       The location path to which the source is to be cloned, checked out, or exported. Default value: the name of the resource block. Any helper files required for enabling this securegit resource will be placed in the parent directory of the source code destination.
   * - ``enable_checkout``
     - **Ruby Types:** TrueClass, FalseClass

       See Git resource documentation.
   * - ``enable_submodules``
     - **Ruby Types:** TrueClass, FalseClass

       See Git resource documentation.
   * - ``environment``
     - **Ruby Type:** Hash

       A Hash of environment variables in the form of {"ENV_VARIABLE" => "VALUE"}. (These variables must exist for a command to be run successfully.)

       .. note:: The git provider automatically sets the ENV['HOME'] and ENV['GIT_SSH'] environment variables. To override this behavior and provide different values, add ENV['HOME'] and/or ENV['GIT_SSH'] to the environment Hash.
   * - ``group``
     - **Ruby Types:** String, Integer

       See Git resource documentation.
   * - ``ignore_failure``
     - **Ruby Types:** TrueClass, FalseClass

       Continue running a recipe if a resource fails for any reason. Default value: ``false``.
   * - ``notifies``
     - **Ruby Type:** Symbol, 'Chef::Resource[String]', Symbol

       See Chef documenation.
   * - ``private_key``
     - **Ruby Type:** String

       A string containing the entire private key value. This value will be written to a helper file in the parent directory of the destination as specified above.

       .. note:: If private_key is specified, the private_key_file value will be ignored.
   * - ``private_key_file``
     - **Ruby Type:** String

       A string containing the path to a private key file that already exists locally.

       .. note:: If the private_key value is speified, this property will be ignored.
   * - ``reference``
     - **Ruby Type:** String

       See Git resource documenation.
   * - ``remote``
     - **Ruby Type:** String

       See Git resource documentation.
   * - ``repository``
     - **Ruby Type:** String

       See Git resource documentation.
   * - ``retries``
     - **Ruby Type:** Integer

       See Git resource documenation.
   * - ``retry_delay``
     - **Ruby Type:** Integer

       See Git resource documenation.
   * - ``revision``
     - **Ruby Type:** String

       See Git resource documentation.
   * - ``subscribes``
     - **Ruby Type:** Symbol, 'Chef::Resource[String]', Symbol

        See Chef documenation.
   * - ``timeout``
     - **Ruby Type:** Integer

        See Git resource documentation.
   * - ``user``
     - **Ruby Types:** String, Integer

       See Git resource documentation.
 

Examples
=====================================================
The following examples demonstrate various approaches for using resources in recipes. If you want to see examples of how Chef uses resources in recipes, take a closer look at the cookbooks that Chef authors and maintains: https://github.com/opscode-cookbooks.

**Use the a private key string**

.. code-block:: ruby

   securegit 'couch' dodb
     destination '/path/to/couch'
     repository 'git://git.apache.org/couchdb.git'
     revision 'master'
     private_key 'Contents of private key'
     action :sync
   end

**Use a private key file already stored locally**

.. code-block:: ruby

   securegit 'couch' dodb
     destination '/path/to/couch'
     repository 'git://git.apache.org/couchdb.git'
     revision 'master'
     private_key_file '/path/to/private/key_file'
     action :sync
   end
