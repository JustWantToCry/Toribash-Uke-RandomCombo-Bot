local chosen_combo = 0
local cur_mod = math.random(1, 3) - 1
local move = 0

local combo = {
	{
	{ grip = { 1, 0 }, joint = { 3, 2, 3, 3, 2, 3, 3, 1, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3 } },	-- aikido combo[1][1]
	{ grip = { 1, 0 }, joint = { 3, 2, 3, 3, 2, 3, 3, 1, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3 } },
	{ grip = { 0, 0 }, joint = { 3, 2, 3, 3, 2, 3, 3, 1, 3, 3, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3 } },
	{ grip = { 0, 0 }, joint = { 3, 2, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 2, 1, 3, 3, 3, 3, 3, 3 } },
	{ grip = { 0, 0 }, joint = { 3, 2, 3, 3, 3, 3, 3, 1, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 3 } },
	},
	{
	{ grip = { 0, 1 }, joint = { 1, 1, 1, 2, 1, 3, 2, 2, 4, 4, 1, 4, 2, 2, 1, 2, 2, 3, 2, 2 } },	-- combo[2][1]
	{ grip = { 0, 1 }, joint = { 1, 1, 1, 3, 1, 3, 2, 2, 2, 1, 1, 1, 2, 2, 1, 2, 1, 3, 2, 2 } },
	{ grip = { 0, 1 }, joint = { 1, 4, 2, 1, 4, 1, 1, 4, 2, 1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 4 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 4, 4, 4, 2, 4, 4, 2, 4, 4, 4, 4, 2, 2, 4, 4, 2, 2, 4, 4 } },	-- combo[3][1]
	{ grip = { 1, 1 }, joint = { 3, 2, 3, 3, 4, 3, 3, 4, 3, 4, 3, 3, 2, 3, 4, 1, 3, 3, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 1, 2, 3, 1, 3, 2, 2, 3, 4, 3, 3, 2, 1, 2, 2, 1, 4, 3, 1 } },
	{ grip = { 1, 1 }, joint = { 3, 1, 2, 2, 1, 1, 2, 2, 2, 4, 3, 3, 1, 2, 2, 2, 1, 4, 3, 1 } },
	{ grip = { 1, 1 }, joint = { 3, 1, 2, 2, 1, 2, 2, 2, 2, 4, 3, 3, 2, 2, 1, 2, 4, 4, 2, 1 } },
	{ grip = { 1, 1 }, joint = { 3, 1, 2, 2, 1, 2, 1, 2, 2, 2, 2, 3, 1, 1, 2, 2, 2, 4, 2, 2 } },
	},
	{
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 3, 2, 3, 3, 1, 3, 3, 1, 3, 2, 2, 2, 1, 3, 2, 3, 3 } },	-- combo[4][1]
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 3, 2, 3, 3, 1, 3, 3, 1, 3, 2, 2, 2, 1, 3, 1, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 3, 2, 2, 3, 1, 3, 3, 1, 3, 1, 1, 2, 3, 3, 1, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 3, 2, 2, 3, 4, 3, 3, 1, 3, 1, 1, 2, 3, 3, 1, 3, 3 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 4, 4, 4, 2, 4, 4, 2, 4, 4, 4, 4, 2, 2, 4, 4, 2, 2, 4, 4 } },	-- combo[5][1]
	{ grip = { 1, 1 }, joint = { 3, 2, 3, 3, 4, 3, 3, 4, 3, 3, 3, 3, 3, 3, 4, 1, 4, 3, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 2, 3, 2, 2, 3, 3, 1, 1, 3, 3, 3, 3, 3, 2, 1, 1, 4, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 2, 3, 2, 2, 3, 3, 1, 1, 3, 3, 3, 3, 3, 2, 2, 1, 1, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 2, 1, 2, 2, 3, 3, 1, 1, 2, 3, 1, 3, 3, 2, 2, 1, 1, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 2, 1, 2, 2, 3, 3, 1, 1, 2, 3, 1, 3, 3, 2, 2, 1, 1, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 2, 1, 2, 2, 3, 2, 1, 1, 2, 1, 1, 3, 3, 2, 4, 1, 4, 2, 3 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 2, 2, 4, 2, 1, 4, 4, 4, 4, 4, 4, 2, 4, 2, 4, 4, 4, 4, 4 } },	-- combo[6][1]
	{ grip = { 1, 0 }, joint = { 4, 2, 2, 4, 2, 2, 4, 4, 4, 4, 4, 4, 2, 4, 2, 1, 4, 4, 4, 4 } },
	{ grip = { 1, 1 }, joint = { 4, 1, 2, 4, 1, 2, 4, 2, 2, 4, 4, 4, 1, 1, 1, 2, 1, 1, 4, 1 } },
	{ grip = { 1, 1 }, joint = { 4, 1, 2, 4, 1, 2, 4, 2, 2, 4, 4, 4, 1, 1, 1, 2, 1, 1, 4, 1 } },
	{ grip = { 1, 1 }, joint = { 4, 1, 1, 4, 1, 2, 4, 2, 1, 4, 4, 4, 2, 1, 1, 1, 1, 1, 4, 1 } },
	},
	{
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 2, 2, 3, 2, 1, 1, 2, 1, 1, 2, 2, 2, 1, 2, 2, 2, 2 } },	-- judo combo[7][1]
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 2, 1, 4, 1, 1, 2, 1, 2, 2, 2, 2, 1, 2, 1, 1, 1, 2 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 2 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 2 } },
	},
	{
	{ grip = { 1, 1 }, joint = { 3, 3, 3, 3, 2, 3, 1, 2, 3, 1, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 3, 3, 3, 2, 2, 1, 2, 2, 1, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3 } },
	{ grip = { 1, 1 }, joint = { 3, 3, 3, 3, 2, 2, 1, 2, 2, 1, 1, 1, 2, 3, 2, 2, 3, 3, 3, 3 } },	-- combo[8][1]
	},
	{
	{ grip = { 1, 1 }, joint = { 3, 2, 3, 3, 2, 3, 2, 2, 3, 2, 3, 3, 2, 3, 3, 1, 3, 3, 3, 3 } },	-- combo[9][1]
	{ grip = { 1, 0 }, joint = { 3, 1, 1, 1, 2, 2, 1, 1, 2, 1, 3, 1, 1, 2, 2, 2, 1, 3, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 1, 1, 1, 1, 1, 2, 2, 1, 3, 1, 1, 2, 1, 2, 1, 1, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 2, 1, 1, 1, 2, 1, 2, 2, 1, 3, 1, 1, 2, 2, 2, 1, 1, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 3, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 3, 3 } },
	},
	{
	{ grip = { 1, 0 }, joint = { 3, 2, 2, 2, 2, 3, 2, 1, 3, 2, 3, 3, 2, 2, 3, 3, 3, 3, 3, 3 } },	-- combo[10][1]
	{ grip = { 1, 0 }, joint = { 3, 1, 2, 1, 1, 1, 1, 1, 3, 1, 1, 3, 1, 2, 4, 2, 2, 3, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 2, 1, 2, 2, 1, 2, 3, 1, 1, 3, 1, 2, 3, 2, 1, 3, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 1, 1, 2, 2, 1, 1, 3, 1, 1, 3, 2, 2, 3, 2, 1, 3, 3, 3 } },
	{ grip = { 1, 0 }, joint = { 3, 1, 1, 1, 3, 2, 1, 1, 2, 1, 1, 3, 2, 2, 3, 2, 1, 3, 3, 3 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 1, 1, 1, 1, 1, 2, 1, 1, 2, 2, 4, 2, 2, 2, 4, 2, 2, 4, 4 } },	-- wushu combo[11][1]
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 2, 2, 2, 1, 2, 2, 1, 1, 4, 1, 2, 2, 4, 1, 1, 4, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 2, 1, 2, 1, 1, 2, 1, 1, 4, 2, 2, 2, 2, 1, 1, 4, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 2, 2, 2, 1, 2, 4, 1, 1, 4, 2, 2, 4, 4, 1, 1, 4, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 1, 1, 2, 1, 1, 3, 1, 1, 1, 1, 2, 2, 2, 1, 1, 4, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 1, 1, 2, 1, 2, 2, 1, 1, 1, 1, 2, 2, 2, 1, 1, 4, 4 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 1, 4, 4, 1, 4, 4, 2, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 } },	-- combo[12][1]
	{ grip = { 0, 0 }, joint = { 4, 1, 4, 4, 2, 2, 4, 1, 2, 4, 4, 4, 2, 4, 2, 1, 4, 4, 2, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 4, 4, 1, 2, 1, 2, 2, 1, 4, 4, 1, 2, 2, 2, 4, 4, 2, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 1, 2, 2, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 4, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 1, 2, 1, 1, 2, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 4, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 2, 1, 1, 2, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 4, 1, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 3, 1, 3, 3, 3, 3, 3, 2, 3, 3, 3, 3, 3, 3, 1, 1, 3, 2, 3, 3 } },	-- combo[13][1]
	{ grip = { 0, 0 }, joint = { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 2, 2, 1, 3, 1, 3, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 1, 1, 1, 2, 3, 3, 1, 3, 1, 3, 1, 2, 2, 2, 2, 4, 1, 3, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 2, 2, 1, 2, 3, 3, 2, 2, 3, 3, 1, 1, 2, 2, 3, 1, 1, 1, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 1, 2, 2, 2, 1, 1, 1, 1, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 1, 2, 1, 2, 2, 1, 1, 1, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 1, 2, 2, 2, 1, 1, 1, 1, 2 } },
	{ grip = { 0, 0 }, joint = { 3, 3, 3, 3, 1, 2, 1, 1, 2, 3, 3, 1, 2, 2, 2, 2, 1, 1, 1, 2 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 1, 4, 4, 1, 1, 4, 1, 1, 4, 4, 4, 4, 2, 4, 4, 2, 2, 4, 2 } },	-- combo[14][1]
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 4, 2, 2, 4, 1, 1, 4, 4, 4, 4, 1, 2, 4, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 4, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 2, 2, 1, 2, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 1, 2, 2, 1, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 4, 2 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 4, 2 } },
	},
	{
	{ grip = { 0, 0 }, joint = { 4, 1, 1, 2, 1, 1, 4, 2, 1, 4, 4, 4, 2, 3, 4, 2, 4, 4, 4, 4 } },	-- combo[15][1]
	{ grip = { 0, 0 }, joint = { 4, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 4, 2, 2, 2, 1, 1, 1, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 4, 2, 2, 2, 1, 1, 1, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 1, 2, 1, 1, 2, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 2, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 1, 2, 1, 1, 1, 4 } },
	{ grip = { 0, 0 }, joint = { 4, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 4 } },
	},
}

function do_combo_move()
    move = move + 1
    if (combo[chosen_combo][move] ~= nil) then
        for i, v in ipairs(combo[chosen_combo][move].grip) do
            set_grip_info(1, i+10, v)
        end
        for i, v in ipairs(combo[chosen_combo][move].joint) do
            set_joint_state(1, i-1, v)
        end
    else
        chosen_combo = math.random(1, #combo)
        move = 0
        do_combo_move()
    end
end

function redo_combo_move()
    if (combo[chosen_combo][move] ~= nil) then
        for i, v in ipairs(combo[chosen_combo][move].grip) do
            set_grip_info(1, i+10, v)
        end
        for i, v in ipairs(combo[chosen_combo][move].joint) do
            set_joint_state(1, i-1, v)
        end
    else
        chosen_combo = math.random(1, #combo)
        move = 0
        redo_combo_move()
    end
end

function choose_combo()
    if cur_mod == 0 then 
        chosen_combo = math.random(1, 6)
    elseif cur_mod == 1 then 
        chosen_combo = math.random(1, 4) + 6
    elseif cur_mod == 2 then 
        chosen_combo = math.random(1, 5) + 10
    end

    move = 0
    do_combo_move()
end

function activate_uke()

	add_hook("enter_freeze", "fight uke", do_combo_move)
	add_hook("exit_freeze", "fight uke", function() redo_combo_move() end)

	
	chosen_combo = 0
	move = 0

	choose_combo()
end

activate_uke()

add_hook("new_mp_game", "fight uke", activate_uke)
add_hook("new_game", "fight uke", activate_uke)

