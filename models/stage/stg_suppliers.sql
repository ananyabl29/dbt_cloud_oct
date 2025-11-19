WITH supplier_info AS (
    SELECT

        su.s_suppkey AS supplier_id,
        su.s_nationkey AS nation_id,
        s.sname AS supplier_name,
        su.s_address AS supplier_address,
        su.s_phone AS phone_number,
        su.s_comment AS comment,
        su.s_acctbal AS account_balance,
        su.updated_time
    FROM {{source('src','suppliers')}} su
      left JOIN {{ source('newsrc','suppliers') }} AS s
        ON su.s_suppkey = s.skey
)

SELECT *
FROM supplier_info
