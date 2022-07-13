if (soundtrack_num == -1) || (!audio_is_playing(get_music_from_index(soundtrack_num)))
{
    soundtrack_num += 1;
    if (soundtrack_num >= soundtrack_count)
    {
        soundtrack_num = 0;
    }
    audio_play_sound(get_music_from_index(soundtrack_num), 0, false);
}
