#cloud-config
package_update: true
package_upgrade: true

packages:
  - ca-certificates
  - puppet-agent

apt:
  sources:
    puppet7:
      source: "deb http://apt.puppetlabs.com bionic puppet7"
      # TODO expires on 2021-08-17
      key: |
        -----BEGIN PGP PUBLIC KEY BLOCK-----

        mQINBFe2Iz4BEADqbv/nWmR26bsivTDOLqrfBEvRu9kSfDMzYh9Bmik1A8Z036Eg
        h5+TZD8Rrd5TErLQ6eZFmQXk9yKFoa9/C4aBjmsL/u0yeMmVb7/66i+x3eAYGLzV
        FyunArjtefZyxq0B2mdRHE8kwl5XGl8015T5RGHCTEhpX14O9yigI7gtliRoZcl3
        hfXtedcvweOf9VrV+t5LF4PrZejom8VcB5CE2pdQ+23KZD48+Cx/sHSLHDtahOTQ
        5HgwOLK7rBll8djFgIqP/UvhOqnZGIsg4MzTvWd/vwanocfY8BPwwodpX6rPUrD2
        aXPsaPeM3Q0juDnJT03c4i0jwCoYPg865sqBBrpOQyefxWD6UzGKYkZbaKeobrTB
        xUKUlaz5agSK12j4N+cqVuZUBAWcokXLRrcftt55B8jz/Mwhx8kl6Qtrnzco9tBG
        T5JN5vXMkETDjN/TqfB0D0OsLTYOp3jj4hpMpG377Q+6D71YuwfAsikfnpUtEBxe
        NixXuKAIqrgG8trfODV+yYYWzfdM2vuuYiZW9pGAdm8ao+JalDZss3HL7oVYXSJp
        MIjjhi78beuNflkdL76ACy81t2TvpxoPoUIG098kW3xd720oqQkyWJTgM+wV96bD
        ycmRgNQpvqHYKWtZIyZCTzKzTTIdqg/sbE/D8cHGmoy0eHUDshcE0EtxsQARAQAB
        tEhQdXBwZXQsIEluYy4gUmVsZWFzZSBLZXkgKFB1cHBldCwgSW5jLiBSZWxlYXNl
        IEtleSkgPHJlbGVhc2VAcHVwcGV0LmNvbT6JAj4EEwECACgFAle2Iz4CGwMFCQlm
        AYAGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEH9DgoDvjTSfIN0P/jcCRzK8
        WIdhcNz5dkj7xRZb8Oft2yDfenQmzb1SwGGa96IwJFcjF4Nq7ymcDUqunS2DEDb2
        gCucsqmW1ubkaggsYbc9voz/SQwhsQpBjfWbuyOX9DWmW6av/aB1F85wP79gyfqT
        uidTGxQE6EhDbLe7tuvxOHfM1bKsUtI+0n9TALLLHfXUEdtaXCwMlJuO1IIn1PWa
        H7HzyEjw6OW/cy73oM9nuErBIio1O60slPLOW2XNhdWZJCRWkcXyuumRjoepz7WN
        1JgsLOTcB7rcQaBP3pDN0O/Om5dlDQ6oYitoJs/F0gfEgwK68Uy8k8sUR+FLLJqM
        o0CwOg6CeWU4ShAEd1xZxVYW6VOOKlz9x9dvjIVDn2SlTBDmLS99ySlQS57rjGPf
        GwlRUnuZP4OeSuoFNNJNb9PO6XFSP66eNHFbEpIoBU7phBzwWpTXNsW+kAcY8Rno
        8GzKR/2FRsxe5Nhfh8xy88U7BA0tqxWdqpk/ym+wDcgHBfSRt0dPFnbaHAiMRlgX
        J/NPHBQtkoEdQTKA+ICxcNTUMvsPDQgZcU1/ViLMN+6kZaGNDVcPeMgDvqxu0e/T
        b3uYiId38HYbHmD6rDrOQL/2VPPXbdGbxDGQUgX1DfdOuFXw1hSTilwI1KdXxUXD
        sCsZbchgliqGcI1l2En62+6pI2x5XQqqiJ7+
        =HpaX
        -----END PGP PUBLIC KEY BLOCK-----

puppet:
  install: false
  conf_file: /etc/puppetlabs/puppet/puppet.conf
  conf:
    agent:
      server: ${puppet_server}
  csr_attributes:
    extension_requests:
      pp_role: ${puppet_role}
      pp_zone: ${puppet_zone}
