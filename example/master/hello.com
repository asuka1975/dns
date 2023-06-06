$TTL 900
@     IN  SOA hello.com. postmaster.hello.com. (
        2023060621      ; Serial Number
        1800            ; Refresh
        900             ; Retry
        1209600         ; expire
        900             ; minimum
        )
;
      IN    NS  hello.com.
      IN    A   1.2.3.4
www   IN    A   5.6.7.8

