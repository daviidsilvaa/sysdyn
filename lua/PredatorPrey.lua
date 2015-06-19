--- Model that implements predatory-prey dynamics.
PredatorPrey = SysDynModel{
	wolves          = Choice{min = 10,                 default = 40},
	rabbits         = Choice{min = 100,                default = 1000},
	preyGrowth      = Choice{min = 0.01,   max = 1,    default = 0.08},
	preyDeathPred   = Choice{min = 0.0001, max = 0.01, default = 0.001},
	predDeath       = Choice{min = 0.001,  max = 0.5,  default = 0.02},
	predGrowthKills = Choice{min = 0,      max = 0.01, default = 0.00002},
	finalTime       = Choice{min = 50,                 default = 500},
	changes = function(model)
		model.rabbits = model.rabbits
		                + model.preyGrowth * model.rabbits
		                - model.preyDeathPred * model.rabbits * model.wolves

		model.wolves = model.wolves
		               - model.predDeath * model.wolves
		               + model.predGrowthKills * model.rabbits * model.wolves
	end,
	graphics = {
		timeseries = {{"rabbits", "wolves"}},
		phasespace = {{"rabbits", "wolves"}}
	}
}
