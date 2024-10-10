local Elapsed = os.clock()

local TweenService: TweenService = game:GetService("TweenService")
local UserInputService: UserInputService = game:GetService("UserInputService")
local CoinContainer: Model = workspace:WaitForChild("Normal"):WaitForChild("CoinContainer")
local Coins = CoinContainer:GetChildren()

local LocalPlayer: Player = game:GetService("Players").LocalPlayer
local Character: Model? = LocalPlayer.Character
local HumanoidRootPart: Instance = Character:WaitForChild("HumanoidRootPart")

if game.PlaceId ~= 142823291 then LocalPlayer:Kick("Wrong game! This is intended to be ran on Nikilis' Murder Mistery 2.") end

local Bind: string = 'Q'
local Time: number = 5 -- The bigger it is, the better it is
local Delay: number = 0.5
local Collecting: boolean = false

if Debug ~= false then print(`Loaded in {os.clock()-Elapsed}s!`) end

CoinContainer.Changed:Connect(function() Coins = CoinContainer:GetChildren() end)
UserInputService.InputBegan:Connect(function(input: InputObject)
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[Bind] then
		Collecting = not Collecting
		if Collecting then
			print("0")
			while Collecting do
				for _, v in ipairs(Coins) do
					if v and v:FindFirstChild("CoinVisual") then
						local Tween: Tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(Time), { CFrame = v.CFrame })
						Tween:Play()
						Tween.Completed:Wait()
					end
					break
				end
				task.wait(Delay)
			end
		else
			print("1")
			Collecting = false
		end
	end
end)
