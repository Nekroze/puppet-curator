# Class: curator
#
# Parameters: none
#
# Actions:
#
# Sample Usage:
#
class curator (
  $modules = $curator::params::modules,
  $path    = $curator::params::path,
) inherits curator::params {
  
  package { 'librarian-puppet':
    ensure   => '1.0.3',
    provider => 'gem',
  }

  file { '$path/Puppetfile':
    ensure  => file,
    content => template('Puppetfile.erb'),
  }

  exec { 'librarian-puppet install':
    cwd         => '$path',
    subscribe   => File['$path/Puppetfile'],
    refreshonly => true,
    require     => Package['librarian-puppet'],
  }
}