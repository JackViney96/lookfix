//Just a tiny snippet that can be called from a few places
if (PCT_lookFix_vertical_angle < 0) then { 
	PCT_lookFix_vertical_angle = PCT_lookFix_vertical_angle + abs(PCT_lookFix_vertical_angle * PCT_lookfix_RTZ_constant); 
}; 
if (PCT_lookFix_vertical_angle > 0) then { 
	PCT_lookFix_vertical_angle = PCT_lookFix_vertical_angle - abs(PCT_lookFix_vertical_angle * PCT_lookfix_RTZ_constant);
};  