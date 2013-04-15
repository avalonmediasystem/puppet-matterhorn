class matterhorn::install(
  $treeish = "release/1.0.0",
  $tarfile = "matterhorn-1.4.tar.gz"
) {
  include staging

  group { 'matterhorn':
    ensure    => present,
    system    => true
  }

  user { 'matterhorn':
    ensure    => present,
    gid       => 'matterhorn',
    system    => true,
    require   => Group['matterhorn']
  }

  staging::file { $tarfile:
    subdir    => 'matterhorn',
    source    => "https://github.com/avalonmediasystem/avalon-felix/archive/${treeish}.tar.gz"
  }

  file { '/usr/local/matterhorn':
    ensure    => directory,
    owner     => 'matterhorn',
    group     => 'matterhorn',
    mode      => '0775'
  }
  
  exec { 'extract-matterhorn':
    command   => "/bin/tar xzf ${staging::path}/matterhorn/${tarfile} --strip-components 1",
    cwd       => "/usr/local/matterhorn",
    creates   => "/usr/local/matterhorn/lib",
    user      => "matterhorn",
    group     => "matterhorn",
    require   => [File['/usr/local/matterhorn'],User['matterhorn'],Staging::File[$tarfile]]
  }

}


