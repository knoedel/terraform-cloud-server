#cloud-config
merge_how:
  - name: list
    settings: [append]
  - name: dict
    settings: [no_replace, recurse_list]

fqdn: ${server_name}.${domain}

package_update: true
package_upgrade: true

packages:
  - ca-certificates
  - puppet-agent

runcmd:
  - passwd -u root

apt:
  sources:
    puppet7:
      source: "deb http://apt.puppetlabs.com bionic puppet7"
      key: |
        -----BEGIN PGP PUBLIC KEY BLOCK-----

        mQINBFyrv4oBEADhL8iyDPZ+GWN7L+A8dpEpggglxTtL7qYNyN5Uga2j0cusDdOD
        ftPHsurLjfxtc2EFGdFK/N8y4LSpq+nOeazhkHcPeDiWC2AuN7+NGjH9LtvMUqKy
        NWPhPYP2r/xPL547oDMdvLXDH5n+FsLFW8QgATHk4AvlIhGng0gWu80OqTCiL0HC
        W7TftkF8ofP8k90SnLYbI9HDVOj6VYYtqG5NeoCHGAqrb79G/jq64Z/gLktD3IrB
        CxYhKFfJtZ/BSDB8Aa4ht+jIyeFCNSbGyfFfWlHKvF3JngS/76Y7gxX1sbR3gHJQ
        hO25AQdsPYKxgtIgNeB9/oBp1+V3K1W/nta4gbDVwJWCqDRbEFlHIdV7fvV/sqiI
        W7rQ60aAY7J6Gjt/aUmNArvT8ty3szmhR0wEEU5/hhIVV6VjS+AQsI8pFv6VB8bJ
        TLfOBPDW7dw2PgyWhVTEN8KW/ckyBvGmSdzSgAhw+rAe7li50/9e2H8eiJgBbGid
        8EQidZgkokh331CMDkIA6F3ygiB+u2ZZ7ywxhxIRO70JElIuIOiofhVfRnh/ODlH
        X7eD+cA2rlLQd2yWf4diiA7C9R8r8vPrAdp3aPZ4xLxvYYZV8E1JBdMus5GRy4rB
        Avetp0Wx/1r9zVDKD/J1bNIlt0SR9FTmynZj4kLWhoCqmbrLS35325sS6wARAQAB
        tEhQdXBwZXQsIEluYy4gUmVsZWFzZSBLZXkgKFB1cHBldCwgSW5jLiBSZWxlYXNl
        IEtleSkgPHJlbGVhc2VAcHVwcGV0LmNvbT6JAlQEEwEKAD4WIQTWgR7Tre64RBr1
        qo9FKLbNnmHvJgUCXKu/igIbAwUJC0c1AAULCQgHAwUVCgkICwUWAgMBAAIeAQIX
        gAAKCRBFKLbNnmHvJg/vD/0eOl/pBb6ooGnzg2qoD+XwgOK3HkTdvGNZKGsIrhUG
        q6O0zoyPW8v9b/i7QEDre8QahARmMAEQ+T3nbNVzw4kpE+YIrEkKjoJsrF8/K/1L
        zBHJCc3S9oF9KubG5BuQ4bAmcvnI+qpEYbSTLHztYGUfXAGu+MnaDf4C60G7zM6m
        ec4bX8lVnt+gcsGGGCdN89XsZLBNdv21z9xMeaAPiRYJpbqwrb8cYbKQeqFSQt2M
        UylN5oVeN77Q8iyXSyVwpc6uKzXdQ8bVPbKUTWSXQ4SSp0HJjtAMiDH2pjty4PG6
        EgZ6/njJLOzQ29ZgFrS19XLONlptHwKzLYB8nJhJvGHfzzInmNttDtNwTA6IxpsR
        4aCnrPWFJRCbmMBNXvBR9B/O+e/T5ngL21ipMEwzEOiQlRSacnO2pICwZ5pARMRI
        dxq/5BQYry9HNlJDGR7YIfn7i0oCGk5BxwotSlAPw8jFpNU/zTOvpQAdPvZje2JP
        6GS+hYxSdHsigREXI2gxTvpcLk8LOe9PsqJv631e6Kvn9P9OHiihIp8G9fRQ8T7y
        elHcNanV192mfbWxJhDAcQ+JEy9883lOanaCoaf/7z4kdmCQLz5/oNg2K0qjSgZH
        JY/gxCOwuAuUJlLcAXQG6txJshfMxyQUO46DXg0/gjwkKgT/9PbTJEN/WN/G6n1h
        lQ==
        =nKF2
        -----END PGP PUBLIC KEY BLOCK-----

puppet:
  install: false
  conf_file: /etc/puppetlabs/puppet/puppet.conf
  conf:
    agent:
      server: ${puppet_server}
  csr_attributes_path: /etc/puppetlabs/puppet/csr_attributes.yaml
  csr_attributes:
    extension_requests:
      pp_role: ${puppet_role}
      pp_zone: ${puppet_zone}
