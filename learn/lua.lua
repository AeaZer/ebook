local function archive1()
    local a = "1"
    local numa = tonumber(a)
    print(numa)
    print(type(a))

    -- 类型转换失败结果为 nil
    print(tonumber("aaa"))

    -- 表达式
    local pi = math.pi
    print(pi)

    local t = { "a", "b" }
    local tz = { "a", "b" }
    local tc = { [1] = "a", [2] = "b" }
    -- lua 数组的下标是从 1 开始的
    print(tz == t) -- false, lua 同样不支持数组比较但是编译不报错
    print(tc == t) -- false
    print(type(t))
    print(type(tc))
    t.x = 11

    local tt = { color = "aa", thick = 111, npoint = 4, { a = 1, b = 2 } }
    print(tt.color)
end

local function sum(a, b)
    if type(a) ~="number" then
        a = tonumber(a)
        if a == nil then
            return -1
        end
    end
    if type(b) ~="number" then
        b = tonumber(b)
        if b == nil then
            return -1
        end
    end 
    return a + b
end

local function repeatPrint10(s)
    local i = 0
    repeat
        print(s)
    until i == 10
end

-- print(repeatPrint10("哈哈"))

local function whileDoWithCondition(b)
    while b do
        print("hello world")
        b = false
    end
end

-- print(whileDoWithCondition(true))

local function short(a, b)
    return a and b or false
end

-- print(short(false, 2))

local s, e = string.find("hello world", "s")
-- print(e)

local function sumRecursive(n)
    if n == 1 then
        return 1
    else
        return n + sumRecursive(n - 1)
    end
end

-- print(sumRecursive(10))

-- 多行注释
--[[
local funca = {p = print}
funca.p("hello world")
funca.p = math.pi
print(funca.p)
--]]

-- 排序
local network = {
    {name = "111", ip = "127.0.0.1"},
    {name = "222", ip = "127.0.0.1"},
}
table.sort(network, function (a, b)
    return a.name > b.name
end)

-- print(network[1].name)

-- for 循环
--[[
for index, value in ipairs(network) do
    print(index, value.name)
end

for key, value in pairs(network) do
    print(key, value.name)
end
--]]

-- 万物皆可 table
local lib = {
    sum = function (a, b) return a + b end,
    abs = function (a, b) return math.abs(a - b) end
}
-- print(lib.sum(1,2))
-- print(lib.abs(1,2))

local reverseS = "abc"
-- print(string.reverse(reverseS))
-- print(string.len(reverseS))

-- 协同程序有四种不同的状态分别是 挂起-suspended 运行-running 死亡-dead 和正常-normal
local co = coroutine.create(function ()
    print("hi coroutine")
end)
-- 查看协同程序的状态
-- print(coroutine.status(co))
-- 启动或者重新启动协同程序
-- coroutine.resume(co)
-- print(coroutine.status(co))

-- 协同程序中 yield 的使用
local coroutinestr = "abc"

co = coroutine.create(function (a)
    local l = string.len(coroutinestr)
    for i = 1, l do
        print(coroutinestr:sub(i,i))
        -- 挂起协同程序
        coroutine.yield()
    end
end)

--[[
coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

-- 数据结构

local a = {}
for i = 1, 10, 2 do -- 第三个形参是 step 表示步长
    a[i] = 0
end
print(#a) -- 结果输出 1 因为 # 至适合获取连续下标的 table
print(a[2]) -- nil

a = {}
for i = 1, 10, 2 do 
    table.insert(a, i)
end
print(#a) -- 输入结果是 5 


a = {}
local count = 0 
for i = 1, 10, 1 do
    a[i] = {}
    for j = 1, 10, 1 do
        count = count + 1
        a[i][j] = count
    end
end
print(a[2][2])
]]

--[[
local l = {"a", "b"}
for key, value in pairs(l) do
    print(key) -- 此时的 key == index
end

-- 和下面的表达式是等价的

for index, value in ipairs(l) do
    print(index) 
end
]]

-- 实现双向队列
local list  = {}

function list.new()
    return {first = 0, last = -1}
end

function list.pushfirst(list, value)
    local first = list.first-1
    list.first = first
    list[first] = value
end

-- 创建一个新列表
local myList = list.new()

-- 在列表开头添加元素
list.pushfirst(myList, 10)
list.pushfirst(myList, 20)
list.pushfirst(myList, 30)

-- 打印列表内容
for i = myList.first, myList.last do
    print(myList[i])
end


