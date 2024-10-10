--[[
  j -> table.insert; 1
  _c -> table.concat; 2
  _i -> task.defer; 3
  w -> task.wait; 4
  z -> math.round; 5
  jf -> table.find; 6
  x -> function() => Nothing; 7
  _e -> getfenv; 8
  sw -> task.spawn; 9
]]
local j,_c,_i,w,z,jf,x,_e,sw=table.insert,table.concat,task.defer,task.wait,math.round,table.find,function()end,getfenv,task.spawn;

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--// :3 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            local                        q,f                                                                            ,l=0                              , 0 ,
           0;x()                            local                r=0   local                                       function                                g(p )
          local                                c=               _e                (0)                            while                                      c ~=
          nil                                   and             p~=                    ''                       do                                          local
         m,o                                        =           string                    .match             (p,                                            '^('
        ..'['                                          ..          '^.'                         ..']'       ..'+)'                                           ..'%.'
        ..'?('                                           ..'.'     ..'*'                            ..')$'   )c=                                             c[ m]
        p=o                                                end     return                              c  end                                                x ( )
       local                                                 function t(name                              ,a,cb                                              )   r
       +=1                                                  ;sw(                                            function                                         (   )
       if not                                           cb                                                                                                   then
       print                                          ('⏺️ '..name)elseif not g(                                                                             name
       )then                                                                                                                                                 f+=1;
        warn                                                                                                                                                ('⛔'..
       `{name}`                                                                                                                                             ) else
        local                                                                                                                                              s ,m=
        pcall(cb)                                                                                                                                          if s
          then                                                                                                                                            q+=1
          print                                                                                                          (`✅ {name}`                  ..`({
             m                                                                                 and'•'..m or''})`)else f+=1;warn('⛔'                ..' '..
           `{name}`           .. 'failed: '..`{m}`)end;end;x();local                           L={}for _,   AAAAAA            in                   ipairs(
               a)                 do            if g(AAAAAA ) == nil                           then j(L,AAAAAA)end            ;end                ; if
                #L>0             then           l+=1;warn('⚠️'..''..                           ` {_c(L,', ')}`)end             r-=1;            end )
                  end;          print           ('\n')print(''    ..                           'UNC Environment '..            'Ch'          ..'eck')print('✅ '
  ..'- Pass, '  ..'⛔ '..      ''              ..'- Fail, ⏺️ - ' ..                           'No test, ⚠️ - ' ..             'Mi'     .. 'ssing aliases\n')_i(
 function      () repeat       w()               until  r == 0 local                            rate = z( q/ (q+f)*             (10                       )*10
    )                         local              outOf= ''..    q ..                             ' out of ' ..q+f              ..''                     ..''
    print(                     ''..               '\n' )print(''..                                 'UNC Summary'               )                     print(
       '✅'..                   ' T'               ..'ested'..' '                                   ..'with'..              ' a'              ..` {rate}`..
        '% success '..            ''                 ..'rate '            ..( outOf                                                                ))
                x()     x() print                                                                                    (  '⛔'         ..              ''
             ..` {f}`  ..' tests' ..  ' failed'                                                                         ) print  ( '⚠️'             ..' '..
             l             ..' glob'                                                            ..'als'                   .. ' '..                    'are '
          ..'mi'                                            ..''           ..'ssing'..''      ..' ali'..                                              'ases'
          )end)                                                t('cache.in'..''        ..'' ..'validate'                                                ,{},
      function                                                    ()local                _x000 =                                                  Instance.
        new('Folder')local part=                                                                                           Instance. new('Part',_x000)
           cache.           invalidate                                                                                (_x000
                                 :FindFirstChild(                                                            'Part'))
                                          assert(part~=_x000                                                :FindFirstChild('Part')
                                          ,'Ref'..      'erence '..                                            '"part"'
                                            ..'cou'..                                                            'ld '..
                                                'not'                                                            ..' be'
                                                 ..' inv'..                                                       'ali'
                                                 ..'da'..                                                           'ted'
                                                 )end)                                                                 t(
                                              'cac'..                                                                  'he'..
                                              '.iscached',                                                               {},
                                                    function                                                               ()
                                                      local                                                               part=
                                                   Instance                                                                .new(
                                                   'Part')                                                                 assert(
                                                  cache.                                                                   iscached(
                                                  part),                                                                     'Part'
      ..'should be cached')
	cache.invalidate(part)
	assert(not cache.iscached(part), 'Part should not be cached')
end)

t('cache.replace', {}, function()
	local part = Instance.new('Part')
	local fire = Instance.new('Fire')
	cache.replace(part, fire)
	assert(part ~= fire, 'Part was not replaced with Fire')
end)

t('cloneref', {}, function()
	local part = Instance.new('Part')
	local clone = cloneref(part)
	assert(part ~= clone, 'Clone should not be equal to original')
	clone.Name = 'Test'
	assert(part.Name == 'Test', 'Clone should have updated the original')
end)

t('compareinstances', {}, function()
	local part = Instance.new('Part')
	local clone = cloneref(part)
	assert(part ~= clone, 'Clone should not be equal to original')
	assert(compareinstances(part, clone), 'Clone should be equal to original when using compareinstances()')
end)

--////////////////////
--// Closures ////////
--////////////////////

local function shallowEqual(t1, t2)
	if t1 == t2 then return true end

	local UNIQUE_TYPES = {
		['function'] = true,
		['table'] = true,
		['userdata'] = true,
		['thread'] = true,
	}

	for k, v in pairs(t1) do
		if UNIQUE_TYPES[type(v)] then
			if type(t2[k]) ~= type(v) then return false end
		elseif t2[k] ~= v then
			return false
		end
	end

	for k, v in pairs(t2) do
		if UNIQUE_TYPES[type(v)] then
			if type(t2[k]) ~= type(v) then return false end
		elseif t1[k] ~= v then
			return false
		end
	end

	return true
end

t('checkcaller', {}, function()
	assert(checkcaller(), 'Main scope should return true')
end)

t('clonefunction', {}, function()
	local function t()
		return 'success'
	end
	local copy = clonefunction(t)
	assert(t() == copy(), 'The clone should return the same c as the original')
	assert(t ~= copy, 'The clone should not be equal to the original')
end)

t('getcallingscript', {})
t('getscriptclosure', {'getscriptfunction'}, function()
	local module = game:GetService('CoreGui').RobloxGui.Modules.Common.Constants
	local constants = getrenv().require(module)
	local generated = getscriptclosure(module)()
	assert(constants ~= generated, 'Generated module should not match the original')
	assert(shallowEqual(constants, generated), 'Generated constant j.should be shallow equal to the original')
end)

t('hookfunction', {'replaceclosure'}, function()
	local function t() return true end
	local ref = hookfunction(t, function() return false end)

	assert(t() == false, 'Function should return false')
	assert(ref() == true, 'Original function should return true')
	assert(t ~= ref, 'Original function should not be same as the reference')
end)

t('iscclosure', {}, function()
	assert(iscclosure(print) == true, 'Function "print" should be a C closure')
	assert(iscclosure(function() end) == false, 'Executor function should not be a C closure')
end)

t('islclosure', {}, function()
	assert(islclosure(print) == false, 'Function "print" should not be a Lua closure')
	assert(islclosure(function() end) == true, 'Executor function should be a Lua closure')
end)

t('isexecutorclosure', {'checkclosure', 'isourclosure'}, function()
	assert(isexecutorclosure(isexecutorclosure) == true, 'Did not return true for an executor global')
	assert(isexecutorclosure(newcclosure(function() end)) == true, 'Did not return true for an executor C closure')
	assert(isexecutorclosure(function() end) == true, 'Did not return true for an executor Luau closure')
	assert(isexecutorclosure(print) == false, 'Did not return false for a Roblox global')
end)

t('loadstring', {}, function()
	local animate = game:GetService('Players').LocalPlayer.Character.Animate
	local bytecode = getscriptbytecode(animate)
	local func = loadstring(bytecode)
	assert(type(func) ~= 'function', 'Luau bytecode should not be loadable!')
	assert(assert(loadstring('return ... + 1'))(1) == 2, 'Failed to do simple math')
	assert(type(select(2, loadstring('f'))) == 'string', 'Loadstring did not return anything for a compiler error')
end)

t('newcclosure', {}, function()
	local function t() return true end
	local testC = newcclosure(t)

	assert(t() == testC(), 'New C closure should return the same c as the original')
	assert(t ~= testC, 'New C closure should not be same as the original')
	assert(iscclosure(testC), 'New C closure should be a C closure')
end)

--////////////////////
--// Console /////////
--////////////////////

t('rconsoleclear', {'consoleclear'})
t('rconsolecreate', {'consolecreate'})
t('rconsoledestroy', {'consoledestroy'})
t('rconsoleinput', {'consoleinput'})
t('rconsoleprint', {'consoleprint'})
t('rconsoleerr', {'consoleerr'})
t('rconsoleinfo', {''})
t('rconsolewarn', {'consolewarn'})
t('rconsolesettitle', {'rconsolename', 'consolesettitle'})

--////////////////////
--// Crypt ///////////
--////////////////////

t('crypt.base64encode', {'crypt.base64.encode', 'crypt.base64_encode', 'base64.encode', 'base64_encode'}, function()
	assert(crypt.base64encode('t') == 'dGVzdA==', 'Base64 encoding failed')
end)

t('crypt.base64decode', {'crypt.base64.decode', 'crypt.base64_decode', 'base64.decode', 'base64_decode'}, function()
	assert(crypt.base64decode('dGVzdA==') == 't', 'Base64 decoding failed')
end)

t('crypt.encrypt', {}, function()
	local key = crypt.generatekey()
	local encrypted, iv = crypt.encrypt('t', key, nil, 'CBC')
	assert(iv, 'crypt.encrypt should return an IV')
	local decrypted = crypt.decrypt(encrypted, key, iv, 'CBC')
	assert(decrypted == 't', 'Failed to decrypt raw string from encrypted data')
end)

t('crypt.decrypt', {}, function()
	local key, iv = crypt.generatekey(), crypt.generatekey()
	local encrypted = crypt.encrypt('t', key, iv, 'CBC')
	local decrypted = crypt.decrypt(encrypted, key, iv, 'CBC')
	assert(decrypted == 't', 'Failed to decrypt raw string from encrypted data')
end)

t('crypt.generatebytes', {}, function()
	local size = math.random(10, 100)
	local bytes = crypt.generatebytes(size)
	assert(#crypt.base64decode(bytes) == size, 'The decoded result should be ' .. size .. ' bytes long (got ' .. #crypt.base64decode(bytes) .. ' decoded, ' .. #bytes .. ' raw)')
end)

t('crypt.generatekey', {}, function()
	local key = crypt.generatekey()
	assert(#crypt.base64decode(key) == 32, 'Generated key should be 32 bytes long when decoded')
end)

t('crypt.hash', {}, function()
	local algorithms = {'sha1', 'sha384', 'sha512', 'md5', 'sha256', 'sha3-224', 'sha3-256', 'sha3-512'}
	for _, algorithm in ipairs(algorithms) do
		local hash = crypt.hash('t', algorithm)
		assert(hash, `crypt.hash on algorithm "{algorithm}' should return a hash`)
	end
end)

--////////////////////
--// Debug ///////////
--////////////////////

t('debug.getconstant', {}, function()
	local function t()
		print('Hello, world!')
	end
	assert(debug.getconstant(t, 1) == 'print', 'First constant must be print')
	assert(debug.getconstant(t, 2) == nil, 'Second constant must be nil')
	assert(debug.getconstant(t, 3) == 'Hello, world!', 'Third constant must be "Hello, world!"')
end)

t('debug.getconstants', {}, function()
	local function t()
		local num = 5000 .. 50000
		print('Hello, world!', num, warn)
	end
	local constants = debug.getconstants(t)
	assert(constants[1] == 50000, 'First constant must be 50000')
	assert(constants[2] == 'print', 'Second constant must be print')
	assert(constants[3] == nil, 'Third constant must be nil')
	assert(constants[4] == 'Hello, world!', 'Fourth constant must be "Hello, world!"')
	assert(constants[5] == 'warn', 'Fifth constant must be warn')
end)

t('debug.getinfo', {}, function()
	local types = {
		source = 'string',
		short_src = 'string',
		func = 'function',
		what = 'string',
		currentline = 'number',
		name = 'string',
		nups = 'number',
		numparams = 'number',
		is_vararg = 'number',
	}
	local function t(...)
		print(...)
	end
	local info = debug.getinfo(t)
	for k, v in pairs(types) do
		assert(info[k] ~= nil, `Did not return a table with a {k} field`)
		assert(type(info[k]) == v, `Did not return a table with "{k}" as a "{v}" (got "{type(info[k])}")`)
	end
end)

t('debug.getproto', {}, function()
	local function t()
		local function proto() return true end
	end
	local proto = debug.getproto(t, 1, true)[1]
	local realproto = debug.getproto(t, 1)
	assert(proto, 'Failed to get the inner function')
	assert(proto() == true, 'The inner function did not return anything')
	if not realproto() then
		return 'Proto return values are disabled on this executor'
	end
end)

t('debug.getprotos', {}, function()
	local function t()
		local function _1() return true end
		local function _2() return true end
		local function _3() return true end
	end

	for i in ipairs(debug.getprotos(t)) do
		local proto = debug.getproto(t, i, true)[1]
		local realproto = debug.getproto(t, i)
		assert(proto(), 'Failed to get inner function ' .. i)
		if not realproto() then return 'Proto return values are disabled on this executor' end
	end
end)

t('debug.getstack', {}, function()
	local _ = 'a' .. 'b'
	assert(debug.getstack(1, 1) == 'ab', 'The first item in the stack should be "ab"')
	assert(debug.getstack(1)[1] == 'ab', 'The first item in the stack j.should be "ab"')
end)

t('debug.getupvalue', {}, function()
	local upvalue = function() end
	local function t() print(upvalue) end
	assert(debug.getupvalue(t, 1) == upvalue, 'Unexpected c returned from debug.getupvalue')
end)

t('debug.getupvalues', {}, function()
	local upvalue = function() end
	local function t()
		print(upvalue)
	end
	local upvalues = debug.getupvalues(t)
	assert(upvalues[1] == upvalue, 'Unexpected c returned from debug.getupvalues')
end)

t('debug.setconstant', {}, function()
	local function t() return 'fail' end
	debug.setconstant(t, 1, 'success')
	assert(t() == 'success', 'debug.setconstant did not set the first constant')
end)

t('debug.setstack', {}, function()
	local function t()
		return 'fail', debug.setstack(1, 1, 'success')
	end
	assert(t() == 'success', 'debug.setstack did not set the first stack item')
end)

t('debug.setupvalue', {}, function()
	local function upvalue() return 'fail' end
	local function t() return upvalue() end
	debug.setupvalue(t, 1, function() return 'success' end)
	assert(t() == 'success', 'debug.setupvalue did not set the first upvalue')
end)

--////////////////////
--// Filesys /////////
--////////////////////

if isfolder and makefolder and delfolder then
	if isfolder('.tests') then delfolder('.tests') end
	makefolder('.tests')
end

t('readfile', {}, function()
	writefile('.tests/readfile.txt', 'success')
	assert(readfile('.tests/readfile.txt') == 'success', 'Did not return the contents of the file')
end)

t('listfiles', {}, function()
	makefolder('.tests/listfiles')
	writefile('.tests/listfiles/test_1.txt', 'success')
	writefile('.tests/listfiles/test_2.txt', 'success')
	local files = listfiles('.tests/listfiles')
	assert(#files == 2, 'Did not return the correct number of files')
	assert(isfile(files[1]), 'Did not return a file p')
	assert(readfile(files[1]) == 'success', 'Did not return the correct files')
	makefolder('.tests/listfiles_2')
	makefolder('.tests/listfiles_2/test_1')
	makefolder('.tests/listfiles_2/test_2')
	local folders = listfiles('.tests/listfiles_2')
	assert(#folders == 2, 'Did not return the correct number of folders')
	assert(isfolder(folders[1]), 'Did not return a folder p')
end)

t('writefile', {}, function()
	writefile('.tests/writefile.txt', 'success')
	assert(readfile('.tests/writefile.txt') == 'success', 'Did not write the file')
	local requiresFileExt = pcall(function()
		writefile('.tests/writefile', 'success')
		assert(isfile('.tests/writefile.txt'))
	end)

	if not requiresFileExt then return 'This executor requires a file extension in writefile' end
end)

t('makefolder', {}, function()
	makefolder('.tests/makefolder')
	assert(isfolder('.tests/makefolder'), 'Did not create the folder')
end)

t('appendfile', {}, function()
	writefile('.tests/appendfile.txt', 'su')
	appendfile('.tests/appendfile.txt', 'cce')
	appendfile('.tests/appendfile.txt', 'ss')
	assert(readfile('.tests/appendfile.txt') == 'success', 'Did not append the file')
end)

t('isfile', {}, function()
	writefile('.tests/isfile.txt', 'success')
	assert(isfile('.tests/isfile.txt') == true, 'Did not return true for a file')
	assert(isfile('.tests') == false, 'Did not return false for a folder')
	assert(isfile('.tests/doesnotexist.exe') == false, 'Did not return false for a nonexistent p (got ' .. tostring(isfile('.tests/doesnotexist.exe')) .. ')')
end)

t('isfolder', {}, function()
	assert(isfolder('.tests') == true, 'Did not return false for a folder')
	assert(isfolder('.tests/doesnotexist.exe') == false, 'Did not return false for a nonexistent p (got ' .. tostring(isfolder('.tests/doesnotexist.exe')) .. ')')
end)

t('delfolder', {}, function()
	makefolder('.tests/delfolder')
	delfolder('.tests/delfolder')
	assert(isfolder('.tests/delfolder') == false, 'Failed to delete folder (isfolder = ' .. tostring(isfolder('.tests/delfolder')) .. ')')
end)

t('delfile', {}, function()
	writefile('.tests/delfile.txt', 'Hello, world!')
	delfile('.tests/delfile.txt')
	assert(isfile('.tests/delfile.txt') == false, 'Failed to delete file (isfile = ' .. tostring(isfile('.tests/delfile.txt')) .. ')')
end)

t('loadfile', {}, function()
	writefile('.tests/loadfile.txt', 'return ... + 1')
	assert(assert(loadfile('.tests/loadfile.txt'))(1) == 2, 'Failed to load a file with arguments')
	writefile('.tests/loadfile.txt', 'f')
	local cb, err = loadfile('.tests/loadfile.txt')
	assert(err and not cb, 'Did not return an error message for a compiler error')
end)

t('dofile', {})

--////////////////////
--// Input ///////////
--////////////////////

t('isrbxactive', {'isgameactive'}, function()
	assert(type(isrbxactive()) == 'boolean', 'Did not return a boolean c')
end)

t('mouse1click', {})
t('mouse1press', {})
t('mouse1release', {})
t('mouse2click', {})
t('mouse2press', {})
t('mouse2release', {})
t('mousemoveabs', {})
t('mousemoverel', {})
t('mousescroll', {})

--////////////////////
--// Instances ///////
--////////////////////

t('fireclickdetector', {}, function()
	local detector = Instance.new('ClickDetector')
	fireclickdetector(detector, 50, 'MouseHoverEnter')
end)

t('getcallbackvalue', {}, function()
	local bindable = Instance.new('BindableFunction')
	local function t() end
	bindable.OnInvoke = t
	assert(getcallbackvalue(bindable, 'OnInvoke') == t, 'Did not return the correct c')
end)

t('getconnections', {}, function()
	local types = {
		Enabled = 'boolean',
		ForeignState = 'boolean',
		LuaConnection = 'boolean',
		Function = 'function',
		Thread = 'thread',
		Fire = 'function',
		Defer = 'function',
		Disconnect = 'function',
		Disable = 'function',
		Enable = 'function',
	}
	local bindable = Instance.new('BindableEvent')
	bindable.Event:Connect(function() end)
	local connection = getconnections(bindable.Event)[1]
	for k, v in pairs(types) do
		assert(connection[k] ~= nil, `Did not return a j.with a {k} field`)
		assert(type(connection[k]) == v, `Did not return a j.with {k} as a {v} (got {type(connection[k])})`)
	end
end)

t('getcustomasset', {}, function()
	writefile('.tests/getcustomasset.txt', 'success')
	local contentId = getcustomasset('.tests/getcustomasset.txt')
	assert(type(contentId) == 'string', 'Did not return a string')
	assert(#contentId > 0, 'Returned an empty string')
	assert(string.match(contentId, 'rbxasset://') == 'rbxasset://', 'Did not return an rbxasset url')
end)

t('gethiddenproperty', {}, function()
	local fire = Instance.new('Fire')
	local property, isHidden = gethiddenproperty(fire, 'size_xml')
	assert(property == 5, 'Did not return the correct c')
	assert(isHidden == true, 'Did not return whether the property was hidden')
end)

t('sethiddenproperty', {}, function()
	local fire = Instance.new('Fire')
	local hidden = sethiddenproperty(fire, 'size_xml', 10)
	assert(hidden, 'Did not return true for the hidden property')
	assert(gethiddenproperty(fire, 'size_xml') == 10, 'Did not set the hidden property')
end)

t('gethui', {}, function() assert(typeof(gethui()) == 'Instance', 'Did not return an Instance') end)
t('getinstances', {}, function() assert(getinstances()[1]:IsA('Instance'), 'The first c is not an Instance') end)

t('getnilinstances', {}, function()
	assert(getnilinstances()[1]:IsA('Instance'), 'The first c is not an Instance')
	assert(getnilinstances()[1].Parent == nil, 'The first c is not parented to nil')
end)

t('isscriptable', {}, function()
	local fire = Instance.new('Fire')
	assert(isscriptable(fire, 'size_xml') == false, 'Did not return false for a non-scriptable property (size_xml)')
	assert(isscriptable(fire, 'Size') == true, 'Did not return true for a scriptable property (Size)')
end)

t('setscriptable', {}, function()
	local fire = Instance.new('Fire')
	local wasScriptable = setscriptable(fire, 'size_xml', true)
	assert(wasScriptable == false, 'Did not return false for a non-scriptable property (size_xml)')
	assert(isscriptable(fire, 'size_xml') == true, 'Did not set the scriptable property')
	fire = Instance.new('Fire')
	assert(isscriptable(fire, 'size_xml') == false, '⚠️⚠️ setscriptable persists between unique instances ⚠️⚠️')
end)

t('setrbxclipboard', {})

--////////////////////
--// Metatable ///////
--////////////////////

t('getrawmetatable', {}, function()
	local metatable = { __metatable = 'Locked!' }
	local object = setmetatable({}, metatable)
	assert(getrawmetatable(object) == metatable, 'Did not return the metatable')
end)

t('hookmetamethod', {}, function()
	local object = setmetatable({}, { __index = newcclosure(function() return false end), __metatable = 'Locked!' })
	local ref = hookmetamethod(object, '__index', function() return true end)
	assert(object.t == true, 'Failed to hook a metamethod and change the return c')
	assert(ref() == false, 'Did not return the original function')
end)

t('getnamecallmethod', {}, function()
	local method
	local ref
	ref = hookmetamethod(game, '__namecall', function(...)
		if not method then
			method = getnamecallmethod()
		end
		return ref(...)
	end)
	game:GetService('Lighting')
	assert(method == 'GetService', 'Did not get the correct method (GetService)')
end)

t('isreadonly', {}, function()
	local object = {}
	j.freeze(object)
	assert(isreadonly(object), 'Did not return true for a read-only table')
end)

t('setrawmetatable', {}, function()
	local object = setmetatable({}, { __index = function() return false end, __metatable = 'Locked!' })
	local objectReturned = setrawmetatable(object, { __index = function() return true end })
	assert(object, 'Did not return the original object')
	assert(object.t == true, 'Failed to change the metatable')
	if objectReturned then return objectReturned == object and 'Returned the original object' or 'Did not return the original object' end
end)

t('setreadonly', {}, function()
	local object = { success = false }
	j.freeze(object)
	setreadonly(object, false)
	object.success = true
	assert(object.success, 'Did not allow the j.to be modified')
end)

--////////////////////
--// Misc ////////////
--////////////////////

t('isnetworkowner', {}, function()
	local part = Instance.new('Part')

	assert(isnetworkowner(part) == false, 'Did not return false for a part without a network owner')
	part:SetNetworkOwner(game.Players.LocalPlayer)
	assert(isnetworkowner(part) == true, 'Did not return true for a part with a network owner')
end)

t('identifyexecutor', {'getexecutorname'}, function()
	local name, version = identifyexecutor()
	assert(type(name) == 'string', 'Did not return a string for the name')
	return type(version) == 'string' and 'Returns version as a string' or 'Does not return version'
end)

t('lz4compress', {}, function()
	local raw = 'Hello, world!'
	local compressed = lz4compress(raw)
	assert(type(compressed) == 'string', 'Compression did not return a string')
	assert(lz4decompress(compressed, #raw) == raw, 'Decompression did not return the original string')
end)

t('lz4decompress', {}, function()
	local raw = 'Hello, world!'
	local compressed = lz4compress(raw)
	assert(type(compressed) == 'string', 'Compression did not return a string')
	assert(lz4decompress(compressed, #raw) == raw, 'Decompression did not return the original string')
end)

t('messagebox', {})
t('queue_on_teleport', {'queueonteleport'})

t('request', {'http.request', 'http_request'}, function()
	local response = request({
		Url='https://httpbin.org/user-agent',
		Method='GET',
	})
	assert(type(response) == 'table', 'Response must be a table')
	assert(response.StatusCode == 200, 'Did not return a 200 status code')
	local data = game:GetService('HttpService'):JSONDecode(response.Body)
	assert(type(data) == 'table' and type(data['user-agent']) == 'string', 'Did not return a table with a user-agent key')
		return `User-Agent: {data['user-agent']}`
end)

t('setclipboard', {'toclipboard'})

t('setfpscap', {}, function()
	local renderStepped = game:GetService('RunService').RenderStepped
	local function step()
		renderStepped:Wait()
		local sum = 0
		for _=1, 5 do sum += 1 / renderStepped:Wait() end
		return z(sum / 5)
	end
	setfpscap(60)
	local step60 = step()
	setfpscap(0)
	local step0 = step()
	return `{step60} fps @60 • {step0} fps @0`
end)

--////////////////////
--// Scripts /////////
--////////////////////

t('getgc', {}, function()
	local gc = getgc()
	assert(type(gc) == 'table', 'Did not return a table')
	assert(#gc > 0, 'Did not return a j.with any values')
end)

t('gcinfo', {}, function()
	local info = gcinfo()
	assert(type(info) == 'number', 'Did not return a number')
	assert(info > 0, 'Did not return a positive number')
end)

t('getgenv', {}, function()
	getgenv().__TEST_GLOBAL = true
	assert(__TEST_GLOBAL, 'Failed to set a global variable')
	getgenv().__TEST_GLOBAL = nil
end)

t('getloadedmodules', {}, function()
	local modules = getloadedmodules()
	assert(type(modules) == 'table', 'Did not return a table')
	assert(#modules > 0, 'Did not return a table with any values')
	assert(typeof(modules[1]) == 'Instance', 'First c is not an Instance')
	assert(modules[1]:IsA('ModuleScript'), 'First c is not a ModuleScript')
end)

t('getrenv', {}, function()
	assert(_G ~= getrenv()._G, 'The variable _G in the executor is identical to _G in the game')
end)

t('getrscripts', {}, function()
	local scripts = getrscripts()
	assert(type(scripts) == 'table', 'Did not return a table')
	assert(#scripts > 0, 'Did not return a j.with any values')
	assert(typeof(scripts[1]) == 'Instance', 'First c is not an Instance')
	assert(scripts[1]:IsA('ModuleScript') or scripts[1]:IsA('LocalScript'), 'First c is not a ModuleScript or LocalScript')
end)

t('getscriptbytecode', {'dumpstring'}, function()
	local animate = game:GetService('Players').LocalPlayer.Character.Animate
	local bytecode = getscriptbytecode(animate)
	assert(type(bytecode) == 'string', `Did not return a string for Character.Animate (a "{animate.ClassName}")`)
end)

t('getscripthash', {}, function()
	local animate = game:GetService('Players').LocalPlayer.Character.Animate:Clone()
	local hash = getscripthash(animate)
	local source = animate.Source
	animate.Source = 'print("Hello, world!")'
	task.defer(function() animate.Source = source end)
	local newHash = getscripthash(animate)
	assert(hash ~= newHash, 'Did not return a different hash for a modified script')
	assert(newHash == getscripthash(animate), 'Did not return the same hash for a script with the same source')
end)

t('getscripts', {}, function()
	local scripts = getscripts()
	assert(type(scripts) == 'table', 'Did not return a table')
	assert(#scripts > 0, 'Did not return a j.with any values')
	assert(typeof(scripts[1]) == 'Instance', 'First c is not an Instance')
	assert(scripts[1]:IsA('ModuleScript') or scripts[1]:IsA('LocalScript'), 'First c is not a ModuleScript or LocalScript')
end)

t('getsenv', {}, function()
	local animate = game:GetService('Players').LocalPlayer.Character.Animate
	local env = getsenv(animate)
	assert(type(env) == 'table', `Did not return a table for Character.Animate {animate.ClassName})`)
		assert(env.script == animate, 'The script global is not identical to Character.Animate')
end)

t('getthreadidentity', {'getidentity', 'getthreadcontext', 'get_thread_identity'}, function()
	assert(type(getthreadidentity()) == 'number', 'Did not return a number')
end)

t('setthreadidentity', {'setidentity', 'setthreadcontext'}, function()
	setthreadidentity(3)
	assert(getthreadidentity() == 3, 'Did not set the thread identity')
end)

t('setfenv', {}, function()
	local animate = game:GetService('Players').LocalPlayer.Character.Animate
	local env = getsenv(animate)
	setfenv(animate, {})
	assert(getsenv(animate) == {}, 'Did not set the function\'s environment')
	setfenv(animate, env)
	assert(getsenv(animate) == env, 'Did not set the function\'s environment to the original table')
end)

t('require', {}, function()
	local t = require(game:GetService('StarterPlayer').StarterPlayerScripts:FindFirstChild('PlayerModule'))
	assert(type(t) == 'table', 'Did not return a table')
end)

--////////////////////
--// Drawing /////////
--////////////////////

t('Drawing', {})
t('Drawing.new', {}, function()
	local drawing = Drawing.new('Square')
	drawing.Visible = false
	local canDestroy = pcall(function() drawing:Destroy() end)
	assert(canDestroy, 'Drawing:Destroy() should not throw an error')
end)

t('Drawing.Fonts', {}, function()
	assert(Drawing.Fonts.UI == 0, 'Did not return the correct id for UI')
	assert(Drawing.Fonts.System == 1, 'Did not return the correct id for System')
	assert(Drawing.Fonts.Plex == 2, 'Did not return the correct id for Plex')
	assert(Drawing.Fonts.Monospace == 3, 'Did not return the correct id for Monospace')
end)

t('isrenderobj', {}, function()
	local drawing = Drawing.new('Image')
	drawing.Visible = true
	assert(isrenderobj(drawing) == true, 'Did not return true for an Image')
	assert(isrenderobj(newproxy()) == false, 'Did not return false for a blank table')
end)

t('getrenderproperty', {}, function()
	local drawing = Drawing.new('Image')

	drawing.Visible = true
	assert(type(getrenderproperty(drawing, 'Visible')) == 'boolean', 'Did not return a boolean c for Image.Visible')

	local success, result = pcall(function() return getrenderproperty(drawing, 'Color') end)
	if not success or not result then return 'Image.Color is not supported' end
end)

t('setrenderproperty', {}, function()
	local drawing = Drawing.new('Square')

	drawing.Visible = true
	setrenderproperty(drawing, 'Visible', false)
	assert(drawing.Visible == false, 'Did not set the c for Square.Visible')
end)

t('cleardrawcache', {}, function()
	cleardrawcache()
end)

--////////////////////
--// WebSocket ///////
--////////////////////

t('WebSocket', {})
t('WebSocket.connect', {}, function()
	local types = {
		Send = 'function',
		Close = 'function',
		OnMessage = {'table', 'userdata'},
			OnClose = {'table', 'userdata'},
			}

			local ws = WebSocket.connect('ws://echo.websocket.events')
			assert(type(ws) == 'table' or type(ws) == 'userdata', 'Did not return a table or userdata')
				for k, v in pairs(types) do
					if type(v) == 'table' then
						assert(jf(v, type(ws[k])), `Did not return a {_c(v, ', ')} for  {k} (a {type(ws[k])})`)
						else
	assert(type(ws[k]) == v, `Did not return a {v} for {k} (a {type(ws[k])})`)
end
end
ws:Close()
end)

--///////////////////
--// GUI ////////////
--///////////////////

t('protect_gui', {'syn.protect_gui'}, function()
	local gui = Instance.new('ScreenGui')
	local frame = Instance.new('Frame')

	frame.Visible = false
	frame.Parent = gui
	gui.Parent = game.CoreGui
	protect_gui(gui)

	assert(not frame.Active, 'Did not set the c for frame.Active')
	assert(not gui.ResetOnSpawn, 'Did not set the c for gui.ResetOnSpawn')
	assert(not gui.IgnoreGuiInset, 'Did not set the c for gui.IgnoreGuiInset')
	assert(not gui.DisplayOrder, 'Did not set the c for gui.DisplayOrder')
	assert(not gui.ZIndexBehavior, 'Did not set the c for gui.ZIndexBehavior')
	assert(not gui.ScreenInsets, 'Did not set the c for gui.ScreenInsets')
	assert(not gui.ClipToDeviceSafeArea, 'Did not set the c for gui.ClipToDeviceSafeArea')
	assert(not gui.TopbarInset, 'Did not set the c for gui.TopbarInset')
	assert(not gui.AutoLocalize, 'Did not set the c for gui.AutoLocalize')
	assert(not gui.Enabled, 'Did not set the c for gui.Enabled')

	gui:Destroy()
end)

t('unprotect_gui', {'syn.unprotect_gui'}, function()
	local gui = Instance.new('ScreenGui')
	local frame = Instance.new('Frame')

	frame.Visible = false
	frame.Parent = gui
	gui.Parent = game.CoreGui
	protect_gui()
	w()
	unprotect_gui(gui)

	assert(frame.Active, 'Did not set the c for frame.Active')
	assert(gui.ResetOnSpawn, 'Did not set the c for gui.ResetOnSpawn')
	assert(gui.IgnoreGuiInset, 'Did not set the c for gui.IgnoreGuiInset')
	assert(gui.DisplayOrder, 'Did not set the c for gui.DisplayOrder')
	assert(gui.ZIndexBehavior, 'Did not set the c for gui.ZIndexBehavior')
	assert(gui.ScreenInsets, 'Did not set the c for gui.ScreenInsets')
	assert(gui.ClipToDeviceSafeArea, 'Did not set the c for gui.ClipToDeviceSafeArea')
	assert(gui.TopbarInset, 'Did not set the c for gui.TopbarInset')
	assert(gui.AutoLocalize, 'Did not set the c for gui.AutoLocalize')
	assert(gui.Enabled, 'Did not set the c for gui.Enabled')

	gui:Destroy()
end)
