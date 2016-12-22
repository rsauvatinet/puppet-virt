Facter.add("openvz_ids") do
    confine :virtual => :openvzhn
    setcode do
        Facter::Core::Execution.exec('/usr/sbin/vzlist --no-header -a -o ctid')
            .lines
            .map(&:strip)
            .grep(/^\d+$/)
    end
end
