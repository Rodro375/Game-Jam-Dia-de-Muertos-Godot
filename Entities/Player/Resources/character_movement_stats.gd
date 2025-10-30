extends Resource
class_name CharacterMovementStats

@export var running_speed:float = 1500.0
@export var running_acceleration:float = 5000.0
@export var running_decceleration:float = 15000.0
@export var jump_speed:float = -1500
@export var drop_jump_speed:float = -1500
@export var in_air_speed:float = 937.5
@export var in_air_acceleration:float = 5000.0
@export var jump_small_speed:float =-700.0
@export var jumping_decceleration:float = 5000.0 #como running decceleration pero cuando se mueve horizontalmente por el aire
@export var can_dash:bool = false
@export var can_double_jump:bool = false

@export var MOVEMENT_REDUCTION_AFTER_AUTOMOVE:float = 0.5
