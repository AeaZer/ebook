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


