# 玩转数据结构
## 
各种数据结构及算法演示

## 数据库表设计
GRAPH       | DESCRIPTION
-------- | ---
gid | integer, p_k 
gname    |  text, unique
nodecount   | integer

GRAPH_NODE  | DESCRIPTION
-------- | ---
nid | integer, p_k 
gid    |  integer, not null
nname   | text
centerx   | real
centery   |real
order   |integer

GRAPH_EDGE  | DESCRIPTION
-------- | ---
eid | integer, p_k 
gid    |  integer, not null
nid_s   | integer
nid_e   | integer 
weight   |integer

