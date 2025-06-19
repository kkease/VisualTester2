local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.Name = "GrowAGardenSpawner"

-- UI Theme Colors
local bgColor = Color3.fromRGB(15, 15, 15)
local glowColor = Color3.fromRGB(255, 255, 255)

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.Position = UDim2.new(0.5, -175, 0.5, -125)
Frame.BackgroundColor3 = bgColor
Frame.BorderColor3 = glowColor
Frame.BorderSizePixel = 2
Frame.Name = "MainFrame"

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Text = "Grow A Garden Spawner"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = glowColor
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Dropdowns
local Pets = { "Bunny","Dog","Golden Lab","Bee","Hedgehog","Kiwi","Monkey","Orange Tabby","Pig","Rooster","Spotted Deer","Honey Bee","Blood Hedgehog","Blood Kiwi","Cow","Snail","Queen Bee","Bear Bee","Frog","Giant Ant","Grey Mouse","Mole","Night Owl","Owl","Pack Bee","Panda","Polar Bear","Praying Mantis","Purple Dragonfly","Brown Mouse","Squirrel","Red Giant Ant","Red Fox","Kiki","Dragonfly","Raccoon","Zombie Chicken","Cooked Owl","Moon Cat","Sea Otter","Tarantula Hawk","Wasp" }

local Seeds = { "Apple","Avocado","Bamboo","Banana","Beanstalk","Blood Banana","Blue Lollipop","Blueberry","Cacao","Cactus","Candy Blossom","Candy Sunflower","Celestberry","Cherry Blossom","Chocolate Carrot","Coconut","Cranberry","Cursed Fruit","Dragon Fruit","Durian","Easter Egg","Eggplant","Ember Lily","Foxglove","Glowshroom","Grape","Lemon","Lilac","Lotus","Mint","Moon Blossom","Moon Mango","Moonflower","Moonglow","Mushroom","Nightshade","Papaya","Passionfruit","Peach","Pear","Pepper","Pineapple","Pink Lily","Pumpkin","Purple Dahlia","Rainbow Sack","Raspberry","Rose","Soul Fruit","Starfruit","Strawberry","Sugar Apple","Super Seed","Tomato","Venus Flytrap","Watermelon" }

-- Pet Dropdown
local PetDropdown = Instance.new("TextBox", Frame)
PetDropdown.PlaceholderText = "Enter or select a pet"
PetDropdown.Position = UDim2.new(0, 10, 0, 40)
PetDropdown.Size = UDim2.new(0, 330, 0, 30)
PetDropdown.BackgroundColor3 = bgColor
PetDropdown.TextColor3 = glowColor
PetDropdown.Font = Enum.Font.Gotham
PetDropdown.Text = ""

-- Seed Dropdown
local SeedDropdown = Instance.new("TextBox", Frame)
SeedDropdown.PlaceholderText = "Enter or select a seed"
SeedDropdown.Position = UDim2.new(0, 10, 0, 80)
SeedDropdown.Size = UDim2.new(0, 330, 0, 30)
SeedDropdown.BackgroundColor3 = bgColor
SeedDropdown.TextColor3 = glowColor
SeedDropdown.Font = Enum.Font.Gotham
SeedDropdown.Text = ""

-- Pet Spawn Button
local SpawnPet = Instance.new("TextButton", Frame)
SpawnPet.Text = "Spawn Pet"
SpawnPet.Position = UDim2.new(0, 10, 0, 130)
SpawnPet.Size = UDim2.new(0, 330, 0, 30)
SpawnPet.BackgroundColor3 = glowColor
SpawnPet.TextColor3 = bgColor
SpawnPet.Font = Enum.Font.GothamBold
SpawnPet.TextScaled = true

-- Seed Spawn Button
local SpawnSeed = Instance.new("TextButton", Frame)
SpawnSeed.Text = "Spawn Seed"
SpawnSeed.Position = UDim2.new(0, 10, 0, 170)
SpawnSeed.Size = UDim2.new(0, 330, 0, 30)
SpawnSeed.BackgroundColor3 = glowColor
SpawnSeed.TextColor3 = bgColor
SpawnSeed.Font = Enum.Font.GothamBold
SpawnSeed.TextScaled = true

-- CLOSE Button
local CloseBtn = Instance.new("TextButton", Frame)
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextScaled = true
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Spawn Seed
SpawnSeed.MouseButton1Click:Connect(function()
	local seedName = SeedDropdown.Text
	if seedName ~= "" then
		local remote = game.ReplicatedStorage:FindFirstChild("GameEvents") and game.ReplicatedStorage.GameEvents:FindFirstChild("SpawnCollectableSeed")
		if remote then
			remote:FireServer(seedName)
			print("Spawned Seed:", seedName)
		else
			warn("SpawnCollectableSeed remote not found.")
		end
	end
end)

-- Spawn Pet (only if remote is confirmed)
SpawnPet.MouseButton1Click:Connect(function()
	local petName = PetDropdown.Text
	if petName ~= "" then
		local remote = game.ReplicatedStorage:FindFirstChild("GameEvents") and game.ReplicatedStorage.GameEvents:FindFirstChild("PetsService")
		if remote then
			remote:FireServer(petName)
			print("Spawned Pet:", petName)
		else
			warn("PetsService remote not found or not working.")
		end
	end
end)
