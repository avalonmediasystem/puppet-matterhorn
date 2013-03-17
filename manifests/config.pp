class matterhorn::config (
  $matterhorn_base = '/opt/matterhorn',
) {

  File { require => Class['matterhorn::install'], }

  #Matterhorn/lib 
  file { "$matterhorn_base/lib/matterhorn/matterhorn-distribution-service-hls-1.4-SNAPSHOT.jar":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/lib/matterhorn/matterhorn-distribution-service-hls-1.4-SNAPSHOT.jar",
  }
  
  file { "$matterhorn_base/lib/matterhorn/matterhorn-distribution-service-streaming-1.4-SNAPSHOT.jar":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/lib/matterhorn/matterhorn-distribution-service-streaming-1.4-SNAPSHOT.jar",
  }
  
  file { "$matterhorn_base/lib/matterhorn/matterhorn-ingest-service-impl-1.4-SNAPSHOT.jar":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/lib/matterhorn/matterhorn-ingest-service-impl-1.4-SNAPSHOT.jar",
  }
  
  file { "$matterhorn_base/lib/matterhorn/matterhorn-workflow-notifier-avalon-1.4-SNAPSHOT.jar":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/lib/matterhorn/matterhorn-workflow-notifier-avalon-1.4-SNAPSHOT.jar",
  }

  #Matterhorn/etc/encoding

  file { "$matterhorn_base/etc/encoding/avalon.properties":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/encoding/avalon.properties",
  }
  
  #Matterhorn/etc/workflows

  file { "$matterhorn_base/etc/workflows/avalon-audio.xml":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/workflows/avalon-audio.xml",
  }
  
  file { "$matterhorn_base/etc/workflows/avalon-video.xml":
    ensure => file,
    owner  => 'matterhorn',
    group  => 'matterhorn',
    source => "puppet:///local/matterhorn/etc/workflows/avalon-video.xml",
  }



}


