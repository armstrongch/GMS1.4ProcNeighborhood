if (!audio_is_playing(BreatheIn_snd) && !audio_is_playing(BreatheOut_snd))
{
    breathe_counter -= 1;
    if (breathe_counter <= 0)
    {
        if (breathe_in) { audio_play_sound(BreatheIn_snd, 0, false); }
        else { audio_play_sound(BreatheOut_snd, 0, false); }
        breathe_in = !breathe_in;
        var exhaustion_ratio = Player_obj.exhaustion / Player_obj.max_exhaustion;
        breathe_counter = 45 - 45*exhaustion_ratio;
    }
}
