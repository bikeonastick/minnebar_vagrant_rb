stage { 'req-install': before => Stage['rvm-install'] }

class requirements {
  group { "puppet": ensure => "present", }
  exec { "apt-update":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    [ "libgdbm-dev", "libncurses5-dev", "libtool", "pkg-config", "libffi-dev"]: 
      ensure => installed, require => Exec['apt-update']
  }
}

class installrvm {
  include rvm
  rvm::system_user { vagrant: ; }

  if $rvm_installed == "true" {
    rvm_system_ruby {
      'ruby-1.9.2-p320':
        ensure => 'present';
    }
  }
  file {'.rvmrc':
      path    => '/home/vagrant/.rvmrc',
      ensure  => present,
      mode    => 0755,
      content => "rvm_trust_rvmrcs_flag=1",
  }
}

class doinstall {
  class { requirements:, stage => "req-install" }
  include installrvm

  exec { 'rvm autolibs 4':
    require => File['/home/vagrant/.rvmrc'],
    command => '/usr/local/rvm/bin/rvm autolibs 4',
    cwd => '/home/vagrant/minnebar',
  }
  exec { 'rvm requirements':
    require => Exec['rvm autolibs 4'],
    command => '/usr/local/rvm/bin/rvm requirements',
    cwd => '/home/vagrant/minnebar',
  }
  exec { 'ruby install':
    command => '/usr/local/rvm/bin/rvm install ruby-1.9.2-p320',
    cwd => '/home/vagrant/minnebar',
    logoutput => true,
    timeout => 600,
    require => Exec['rvm requirements'],
   }

  /* not working, yet
  exec { 'bundle install':
    command => '/usr/local/rvm/bin/bundle install',
    cwd => '/home/vagrant/minnebar',
    logoutput => true,
    require => Exec['ruby install'],
  }
  */
}

include doinstall
