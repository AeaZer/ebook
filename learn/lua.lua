local a = "1"
local numa = tonumber(a)
print(numa)
print(type(a))

-- 类型转换失败结果为 nil
print(tonumber("aaa"))

-- 表达式
local pi = math.pi
print(pi)

local t = {"a", "b"}
local tz = {"a", "b"}
local tc = {[1] = "a", [2] = "b"}
-- lua 数组的下标是从 1 开始的
print(tz == t)
print(tc == t)
print(type(t))
print(type(tc))
t.x = 11

local tt = {color = "aa", thick = 111, npoint = 4; {a = 1, b = 2}}
print(tt.color)


