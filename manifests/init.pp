# Class: curator
#
# Parameters: none
#
# Actions:
#
# Sample Usage:
#
class curator (
  $modules   = $curator::params::modules,
  $path      = $curator::params::path,
  $forge_url = $curator::params::forge_url,
) inherits curator::params {

  package { 'librarian-puppet':
    ensure   => 'present',
    provider => 'gem',
  }

  file { "${path}/Puppetfile":
    ensure  => file,
    content => template("${module_name}/Puppetfile.erb")
  }

  exec { '/usr/bin/librarian-puppet install':
    cwd         => "${path}",
    subscribe   => File["${path}/Puppetfile"],
    refreshonly => true,
    require     => Package['librarian-puppet']
  }
}