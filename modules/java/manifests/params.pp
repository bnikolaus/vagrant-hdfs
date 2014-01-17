# /etc/puppet/modules/java/manifests/params.pp

class java::params {

        $java_version = $::hostname ? {
            default => "1.7.0_45",
        }
        $java_base = $::hostname ? {
            default     => "/opt/java/",
        }
}
