# freebsd-ports

My ports add-ons collection.

Merge it into the ports tree with [portshaker], perhaps with help from
[portshaker-config].

## Portshaker

On a ZFS based system, install [portshaker], [portshaker-config], and `git`, 
then:

``` shell
zfs create zroot/usr/portshaker
```

and

``` shell
cat > /usr/local/etc/portshaker.conf << LOLCAT
use_zfs="yes"

mirror_base_dir="/usr/portshaker"

poudriere_dataset="zbuilder/poudriere"
poudriere_ports_mountpoint="/usr/local/poudriere/ports"

ports_trees="ports_and_hartzell"

ports_and_hartzell_poudriere_tree="ports_and_hartzell"
ports_and_hartzell_merge_from="ports github:hartzell:freebsd-ports"
LOLCAT
```

and finally

``` shell
portshaker -U
portshaker -M
```

at which point you'll have a copy of the FreeBSD ports tree in
`/usr/portshaker/ports`, a copy of this tree in
`/usr/portshaker/github_hartzell_freebsd-ports` and a copy of the
FreeBSD tree with this tree merged on top in `/usr/portshaker/main`.

Adjust to suit.

Manually building ports and/or configuration of [synth] or [poudriere]
is left as an exercise for the reader.

[portshaker]: https://www.freshports.org/ports-mgmt/portshaker/
[portshaker-config]: https://www.freshports.org/ports-mgmt/portshaker-config/
[poudriere]: https://github.com/freebsd/poudriere
[synth]: https://github.com/jrmarino/synth
