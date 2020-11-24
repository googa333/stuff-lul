--I DO NOT OWN THIS SCRIPT (OrPlayz)
--I saw Typical Flame do this!

local SetSimulationRadius = setsimulationradius or function(radius)
    sethiddenproperty(game:GetService("Players").LocalPlayer,"MaximumSimulationRadius",radius)
    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",radius)
end

game:GetService("RunService").Stepped:Connect(function()
  SetSimulationRadius(math.huge, math.huge)
end)
    local gui = game:GetObjects("rbxassetid://5725019371")[1]
    gui.Parent = game.CoreGui
    local script = Instance.new("LocalScript",gui.Frame)
local origcirclesize = UDim2.new(0, 330,0, 330)
local origcircleudim = UDim.new(1,0)
local origtopbarsize = script.Parent.Frame.Size
script.Parent.Gui.Frame.BackgroundTransparency=0
script.Parent.Gui.Buttons.Size = UDim2.new(0,0,0,0)
script.Parent.Frame.Size=UDim2.new(0,0,0,0)
script.Parent.Size = UDim2.new(0,0,0,0)
script.Parent.Gui.Size=UDim2.new(0,0,0,0)
script.Parent.TextLabel.TextSize=50
script.Parent.TextLabel.TextTransparency=0
script.Parent.UICorner.CornerRadius=origcircleudim
local tweenInfo = TweenInfo.new(
	1, -- Time
	Enum.EasingStyle.Sine, -- EasingStyle
	Enum.EasingDirection.InOut, -- EasingDirection
	0, -- RepeatCount (when less than zero the tween will loop indefinitely)
	false, -- Reverses (tween will reverse once reaching it's goal)
	0 -- DelayTime
)
wait(1)
script.Parent:TweenSize(origcirclesize,Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
wait(2)
script.Parent:TweenSize(UDim2.new(0, 668,0, 330),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
game:GetService("TweenService"):Create(script.Parent.UICorner, tweenInfo, {CornerRadius = UDim.new(0,15)}):Play()

wait(.7)
script.Parent.Frame:TweenSize(origtopbarsize,Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,.7)

game:GetService("TweenService"):Create(script.Parent.TextLabel, tweenInfo, {TextTransparency = 1}):Play()
game:GetService("TweenService"):Create(script.Parent.TextLabel, tweenInfo, {TextSize = 0}):Play()
game:GetService("TweenService"):Create(script.Parent.TextLabel, tweenInfo, {TextTransparency = 1}):Play()
script.Parent.Gui:TweenSize(UDim2.new(0, 668,0, 314),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
script.Parent.Gui.Buttons:TweenSize(UDim2.new(0, 667,0, 198),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,1)
wait(1)
game:GetService("TweenService"):Create(script.Parent.Gui.Frame, tweenInfo, {BackgroundTransparency = 1}):Play()

local UIS = game:GetService("UserInputService")
function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0.50
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.05), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

function playId(id)
    run = false
    for i=0,10 do resetatt() end
wait(.5)
    local kfs = game:GetObjects('rbxassetid://' .. tostring(id))[1];
    local poses = {};
    local frames = {};
    local plr = game.Players.LocalPlayer;
    local chr = plr.Character;
    local hum = chr.Humanoid;
    for i, v in pairs(kfs:GetChildren()) do
        table.insert(frames, v.Time)
        poses[v.Time] = {};
        for o, b in pairs(v:GetDescendants()) do
            b.Parent = v;
            table.insert(poses[v.Time], b);
        end
    end
    for i, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop();
    end
    local timex = 1;
    spawn(function()
        hum.Died:Connect(function()
            run = false
        end)
    end);
    run = true

    while run do
        for K, v in pairs(frames) do
            if not run then
                resetatt()
                break
            end
            if frames[K-1] ~= nil then 
                swait(2)
            end
            for o, b in pairs(poses[v]) do
            if not run then
                resetatt()
                break
            end
                local Duration = frames[K+1] ~= nil and (frames[K+1] - frames[K])/.5
                local Pose = b
                if Pose.ClassName == "Pose" then
                local EasingStyle = Enum.EasingStyle[tostring(Pose["EasingStyle"]):split(".")[3]]
                local EasingDirection = Enum.EasingDirection[tostring(Pose["EasingDirection"]):split(".")[3]]
                if Pose['Name'] == "HumanoidRootPart" then
                elseif Pose['Name'] == "Head" then
                else
                    game:GetService("TweenService"):Create(chr[b.Name].Attachment0, TweenInfo.new(Duration or .5,EasingStyle,EasingDirection,0,false,0), {CFrame = PoseToCF(b, Joints[Pose['Name']])}):Play()
                end
                end
            end

        end
            if not run then
                resetatt()
                break
            end
    end
    for i,v in pairs(Joints) do
        resetatt()
        wait()
        resetatt()
    end
end



dragify(script.Parent)
function c(e,id)
    local t = e.text
	e.MouseButton1Click:Connect(function() if game.Players.LocalPlayer.Character.Head:FindFirstChild("ClientRan") then  playId(id) else e.Text="Run Client" wait(1) e.Text = t end end)
end
local script = Instance.new("LocalScript",gui.Frame.Gui.Buttons)
c(script.Parent.Pogo,3053543383)
c(script.Parent.TPose,2736568442)
c(script.Parent.Rewind,5011408603)
c(script.Parent.Skibidi,4835795413)
c(script.Parent["prickly pose"],3478880765)
c(script.Parent["smooth moves"],4900539662)
c(script.Parent["the roll"],4699826237)
c(script.Parent["double step"],4715102040)
c(script.Parent.anthonyshuffle,4837748730)
c(script.Parent.Spongebob,4896926493)
c(script.Parent.carlton,4837749916)
c(script.Parent.billiejean,4791471969)
    local UserInputService = game:GetService("UserInputService")

local oogabooga = gui.Frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	oogabooga.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

oogabooga.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = oogabooga.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

oogabooga.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
    Joints={}
    script.Parent.Parent.Client.MouseButton1Down:Connect(function()
        
     Root = game.Players.LocalPlayer.Character.HumanoidRootPart
     coroutine.wrap(function()
        Root['Anchored'] = true;
        wait(.8)
        Root['Anchored'] = false;
    end)()
    Torso = game.Players.LocalPlayer.Character.Torso
    Create = function(Obj, Parent)
        local I = Instance.new(Obj);
        I['Parent'] = Parent;
        return I
    end
    Joints = {
        ['Torso'] = Root['RootJoint'];
        ['Left Arm'] = Torso['Left Shoulder'];
        ['Right Arm'] = Torso['Right Shoulder'];
        ['Left Leg'] = Torso['Left Hip'];
        ['Right Leg'] = Torso['Right Hip'];
    }
    JointsCFrame = {}
    for K, V in pairs(Joints) do
        local AP, AO, A0, A1 = Create('AlignPosition', V['Part1']), Create('AlignOrientation', V['Part1']), Create('Attachment', V['Part1']), Create('Attachment', V['Part0'])
        AP['RigidityEnabled'] = true;
        AO['RigidityEnabled'] = true;
        AP['Attachment0'] = A0;
        AP['Attachment1'] = A1;
        AO['Attachment0'] = A0;
        AO['Attachment1'] = A1;
        A0['Name'] = 'Attachment0';
        A1['Name'] = 'Attachment1';
        A0['CFrame'] = V['C1'] * V['C0']:Inverse();
        V:Remove()
        table.insert(JointsCFrame,A0.CFrame)
    end
    game.Players.LocalPlayer.Character.Animate.Disabled = true
    for K, V in next, game.Players.LocalPlayer.Character:GetChildren() do
        if V:IsA('BasePart') then
            coroutine.wrap(function()
                repeat
                    V['CanCollide'] = false
                    game:GetService("RunService").Stepped:Wait()
                until game.Players.LocalPlayer.Character.Humanoid['Health'] < 1
            end)()
        end
    end
    Instance.new("StringValue",game.Players.LocalPlayer.Character.Head).Name="ClientRan"
    script.Parent.Parent.Client.Text = "Ran Client.."
    wait(1)
    script.Parent.Parent.Client.Text="Client"
    end)
    script.Parent.Frame.Play.MouseButton1Click:Connect(function()
    playId(script.Parent.Frame.TextBox.Text)
    end)

    function LoadLibrary(a)
        return loadstring(game:HttpGet("https://pastebin.com/raw/KstdzZVB", true))()
    end
    
function swait(n)
    if n > 1 then for i = 1, n do
        game:GetService("RunService").Heartbeat:Wait();
    end elseif n == 1 then game:GetService("RunService").Heartbeat:Wait() elseif n == 0 then game.RunService.RenderStepped:Wait() end
end
    PoseToCF = function(Pose, Motor)
        return (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] * Motor['C1']:Inverse()):ToObjectSpace(Motor['Part0'].CFrame)
    end
    function resetatt(att)
    i = 1
    for n,v in pairs(Joints) do
        game.Players.LocalPlayer.Character[n].Attachment0.CFrame = JointsCFrame[i]
        i=i+1
    end
    end

    run = false;
    current_id = 0
    local Edit = function(Part,Value,Duration,Style,Direction)
        Style = Style or 'Enum.EasingStyle.Linear'; Direction = Direction or 'Enum.EasingDirection.In'
        local Attachment = Part:FindFirstChild('Attachment0')
        if Attachment ~= nil then
            game:GetService("TweenService"):Create(Attachment,TweenInfo.new(Duration,Enum['EasingStyle'][tostring(Style):split('.')[3]],Enum['EasingDirection'][tostring(Direction):split('.')[3]],0,false,0),{CFrame = Value}):Play()
        end
    end
 function Yield(Seconds)
		local Time = Seconds * .2
		for I = 0,1 do 
			game:GetService('RunService').Stepped:Wait()
		end
	end
