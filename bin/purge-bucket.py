#!/usr/bin/python
import boto

c = boto.connect_s3("mUVmcxXzh8AMfYTWW8vT", "v-4donUqsulqJkz7EQ6FVw9xBS0KT2bHoRnvzWlP", host="objects.dreamhost.com")
b = c.get_bucket("w520", validate=True)

l = [o for o in b.list(prefix="http")]
while len(l):
   s = l[0:1000]
   len(l)
   rs = b.delete_keys(s)
   if len(s) == len(rs.deleted):
       l = l[1000:]
