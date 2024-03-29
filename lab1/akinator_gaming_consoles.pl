% full_name(+ShortName, -FullName). - Полное название консоли
full_name(nes, "Nintendo Entertainment System / Dendy").
full_name(sms, "Sega Master System").
full_name(pce, "PC Engine / TurboGrafx-16").
full_name(smd, "Mega Drive / Genesis").
full_name(gb, "Game Boy").
full_name(gbc, "Game Boy Color").
full_name(snes, "Super Nintendo").
full_name(saturn, "Sega Saturn").
full_name(ps1, "PlayStation 1").
full_name(vb, "VirtualBoy").
full_name(n64, "Nintendo 64").
full_name(dreamcast, "Sega Dreamcast").
full_name(ps2, "PlayStation 2").
full_name(gba, "Game Boy Advance").
full_name(gс, "Nintendo GameCube").
full_name(xbox, "Xbox").
full_name(ds, "Nintendo DS (Lite)").
full_name(psp, "PlayStation Portable").
full_name(xbox360, "Xbox 360").
full_name(ps3, "PlayStation 3").
full_name(wii, "Nintendo Wii").
full_name(n3ds, "Nintendo 3DS").
full_name(wiiu, "Nintendo Wii U").
full_name(vita, "PlayStation Vita").

% answer(+ShortName). - Вывести название консоли на экран
answer(unknown) :- write("Увы, такой консоли нет в базе знаний."), fail.
answer(ShortName) :- write("Думаю, что вы загадали консоль "), full_name(ShortName, FullName), write(FullName), nl.

% portable(+ShortName, -IsPortable). - Консоль позиционируется как портативная
portable(nes, 0).
portable(sms, 0).
portable(pce, 0).
portable(smd, 0).
portable(gb, 1).
portable(gbc, 1).
portable(snes, 0).
portable(saturn, 0).
portable(ps1, 0).
portable(vb, 1).
portable(n64, 0).
portable(dreamcast, 0).
portable(ps2, 0).
portable(gba, 1).
portable(gс, 0).
portable(xbox, 0).
portable(ds, 1).
portable(psp, 1).
portable(xbox360, 0).
portable(ps3, 0).
portable(wii, 0).
portable(n3ds, 1).
portable(wiiu, 0).
portable(vita, 1).

ask_portable(IsPortable) :- write("Ваша консоль позиционируется как портативная?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет"), nl,
	read(IsPortable).

% commercial_failure(+ShortName, -IsCommercialFailure). - Консоль является коммерческим провалом.
commercial_failure(nes, 0).
commercial_failure(sms, 0).
commercial_failure(pce, 0).
commercial_failure(smd, 0).
commercial_failure(gb, 0).
commercial_failure(gbc, 0).
commercial_failure(snes, 0).
commercial_failure(saturn, 1).
commercial_failure(ps1, 0).
commercial_failure(vb, 1).
commercial_failure(n64, 0).
commercial_failure(dreamcast, 1).
commercial_failure(ps2, 0).
commercial_failure(gba, 0).
commercial_failure(gс, 0).
commercial_failure(xbox, 0).
commercial_failure(ds, 0).
commercial_failure(psp, 0).
commercial_failure(xbox360, 0).
commercial_failure(ps3, 0).
commercial_failure(wii, 0).
commercial_failure(n3ds, 0).
commercial_failure(wiiu, 1).
commercial_failure(vita, 1).

ask_commercial_failure(IsCommercialFailure) :- write("Эта консоль была коммерческим провалом?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет"), nl,
	read(IsCommercialFailure).

% has_3d_support(+ShortName, -Has3DSupport). - Консоль имеет официальную поддержку 3D графики. 0 если нет, 1 если с помощью программной эмуляции или дополнений, 2 если аппаратно.
has_3d_support(nes, 0).
has_3d_support(sms, 0).
has_3d_support(pce, 0).
has_3d_support(smd, 1).
has_3d_support(gb, 0).
has_3d_support(gbc, 0).
has_3d_support(snes, 1).
has_3d_support(saturn, 2).
has_3d_support(ps1, 2).
has_3d_support(vb, 1).
has_3d_support(n64, 2).
has_3d_support(dreamcast, 2).
has_3d_support(ps2, 2).
has_3d_support(gba, 1).
has_3d_support(gс, 2).
has_3d_support(xbox, 2).
has_3d_support(ds, 2).
has_3d_support(psp, 2).
has_3d_support(xbox360, 2).
has_3d_support(ps3, 2).
has_3d_support(wii, 2).
has_3d_support(n3ds, 2).
has_3d_support(wiiu, 2).
has_3d_support(vita, 2).

ask_3d_support(Has3DSupport) :- write("Ваша консоль умеет выводить 3D графику?"), nl,
	write(" 2. Да"), nl,
	write(" 1. Да, но только программно или с помощью дополнительных устройств"), nl,
	write(" 0. Нет"), nl,
	read(Has3DSupport).

% difficult_development(+ShortName, -IsDevelopmentDifficult). - Для консоли было трудно разрабатывать ПО.
difficult_development(nes, 0).
difficult_development(sms, 0).
difficult_development(pce, 1).
difficult_development(smd, 0).
difficult_development(gb, 0).
difficult_development(gbc, 0).
difficult_development(snes, 0).
difficult_development(saturn, 1).
difficult_development(ps1, 0).
difficult_development(vb, 1).
difficult_development(n64, 1).
difficult_development(dreamcast, 0).
difficult_development(ps2, 0).
difficult_development(gba, 0).
difficult_development(gс, 1).
difficult_development(xbox, 0).
difficult_development(ds, 0).
difficult_development(psp, 0).
difficult_development(xbox360, 0).
difficult_development(ps3, 1).
difficult_development(wii, 0).
difficult_development(n3ds, 0).
difficult_development(wiiu, 0).
difficult_development(vita, 0).

ask_difficult_development(IsDevelopmentDifficult) :- write("Под вашу консоль тяжело разрабатывать игры?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет"), nl,
	read(IsDevelopmentDifficult).

% motion_controls(+ShortName, -HasMotionControls). - Для консоли выпускалась периферия, позволяющая управлять игрой с помощью тела.
motion_controls(nes, 1).
motion_controls(sms, 0).
motion_controls(pce, 0).
motion_controls(smd, 0).
motion_controls(gb, 0).
motion_controls(gbc, 0).
motion_controls(snes, 0).
motion_controls(saturn, 0).
motion_controls(ps1, 0).
motion_controls(vb, 0).
motion_controls(n64, 0).
motion_controls(dreamcast, 0).
motion_controls(ps2, 1).
motion_controls(gba, 0).
motion_controls(gс, 0).
motion_controls(xbox, 0).
motion_controls(ds, 0).
motion_controls(psp, 0).
motion_controls(xbox360, 1).
motion_controls(ps3, 1).
motion_controls(wii, 1).
motion_controls(n3ds, 0).
motion_controls(wiiu, 1).
motion_controls(vita, 0).

ask_motion_controls(HasMotionControls) :- write("Ваша консоль имела поддержку управления игрой с помощью тела?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет"), nl,
	read(HasMotionControls).

% backwards_compatible(+ShortName, -HasBackwardsCompatibility). - Консоль обратно совместима со своим предшественником. 0, если консоль является первой в серии.
% Учитывается только физическая совместимость с носителем прошлого поколения, переиздания в цифровом магазине не считаются.
backwards_compatible(nes, 0).
backwards_compatible(sms, 0).
backwards_compatible(pce, 0).
backwards_compatible(smd, 1).
backwards_compatible(gb, 0).
backwards_compatible(gbc, 1).
backwards_compatible(snes, 0).
backwards_compatible(saturn, 0).
backwards_compatible(ps1, 0).
backwards_compatible(vb, 0).
backwards_compatible(n64, 0).
backwards_compatible(dreamcast, 0).
backwards_compatible(ps2, 1).
backwards_compatible(gba, 1).
backwards_compatible(gс, 0).
backwards_compatible(xbox, 0).
backwards_compatible(ds, 1).
backwards_compatible(psp, 0).
backwards_compatible(xbox360, 1).
backwards_compatible(ps3, 1).
backwards_compatible(wii, 1).
backwards_compatible(n3ds, 1).
backwards_compatible(wiiu, 1).
backwards_compatible(vita, 0).

ask_backwards_compatible(HasBackwardsCompatibility) :- write("Ваша консоль имеет обратную совместимость?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет, или у консоли нет предшественников"), nl,
	read(HasBackwardsCompatibility).

% optical_media(+ShortName, -HasDiskReader). - Консоль может использовать диски для воспроизведения игр.
optical_media(nes, 0).
optical_media(sms, 0).
optical_media(pce, 1).
optical_media(smd, 1).
optical_media(gb, 0).
optical_media(gbc, 0).
optical_media(snes, 0).
optical_media(saturn, 1).
optical_media(ps1, 1).
optical_media(vb, 0).
optical_media(n64, 0).
optical_media(dreamcast, 1).
optical_media(ps2, 1).
optical_media(gba, 0).
optical_media(gс, 1).
optical_media(xbox, 1).
optical_media(ds, 0).
optical_media(psp, 1).
optical_media(xbox360, 1).
optical_media(ps3, 1).
optical_media(wii, 1).
optical_media(n3ds, 0).
optical_media(wiiu, 1).
optical_media(vita, 0).

ask_optical_media(HasDiskReader) :- write("Игры для вашей консоли записывались на диски?"), nl,
	write(" 1. Да"), nl,
	write(" 0. Нет"), nl,
	read(HasDiskReader).

start :- ask_portable(IsPortable), ask_commercial_failure(IsCommercialFailure), ask_3d_support(Has3DSupport), ask_difficult_development(IsDevelopmentDifficult),
	ask_motion_controls(HasMotionControls), ask_backwards_compatible(HasBackwardsCompatibility), ask_optical_media(HasDiskReader),
	portable(X, IsPortable), commercial_failure(X, IsCommercialFailure), has_3d_support(X, Has3DSupport), difficult_development(X, IsDevelopmentDifficult),
	motion_controls(X, HasMotionControls), backwards_compatible(X, HasBackwardsCompatibility), optical_media(X, HasDiskReader),
	answer(X).
