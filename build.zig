const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const flite = b.addStaticLibrary("flite", null);
    flite.setTarget(target);
    flite.setBuildMode(mode);
    flite.linkLibC();
    flite.addIncludeDir("include");
    flite.addCSourceFiles(&.{
        //"src/audio/au_alsa.c",
        "src/audio/au_command.c",
        "src/audio/au_none.c",
        //"src/audio/au_oss.c",
        //"src/audio/au_palmos.c",
        //"src/audio/au_pulseaudio.c",
        "src/audio/au_streaming.c",
        //"src/audio/au_sun.c",
        //"src/audio/au_win.c",
        //"src/audio/au_wince.c",
        "src/audio/auclient.c",
        "src/audio/audio.c",
        "src/audio/auserver.c",
        "src/cg/cst_cg.c",
        "src/cg/cst_cg_dump_voice.c",
        "src/cg/cst_cg_load_voice.c",
        "src/cg/cst_cg_map.c",
        "src/cg/cst_mlpg.c",
        "src/cg/cst_mlsa.c",
        "src/cg/cst_spamf0.c",
        "src/cg/cst_vc.c",
        "src/hrg/cst_ffeature.c",
        "src/hrg/cst_item.c",
        "src/hrg/cst_rel_io.c",
        "src/hrg/cst_relation.c",
        "src/hrg/cst_utterance.c",
        "src/lexicon/cst_lexicon.c",
        "src/lexicon/cst_lts.c",
        "src/lexicon/cst_lts_rewrites.c",
        "src/regex/cst_regex.c",
        "src/regex/regexp.c",
        "src/regex/regsub.c",
        "src/speech/cst_lpcres.c",
        "src/speech/cst_track.c",
        "src/speech/cst_track_io.c",
        "src/speech/cst_wave.c",
        "src/speech/cst_wave_io.c",
        "src/speech/cst_wave_utils.c",
        "src/speech/g721.c",
        "src/speech/g723_24.c",
        "src/speech/g723_40.c",
        "src/speech/g72x.c",
        "src/speech/rateconv.c",
        "src/stats/cst_cart.c",
        "src/stats/cst_ss.c",
        "src/stats/cst_viterbi.c",
        "src/synth/cst_ffeatures.c",
        "src/synth/cst_phoneset.c",
        "src/synth/cst_ssml.c",
        "src/synth/cst_synth.c",
        "src/synth/cst_utt_utils.c",
        "src/synth/cst_voice.c",
        "src/synth/flite.c",
        "src/utils/cst_alloc.c",
        "src/utils/cst_args.c",
        "src/utils/cst_endian.c",
        "src/utils/cst_error.c",
        "src/utils/cst_features.c",
        //"src/utils/cst_file_palmos.c",
        "src/utils/cst_file_stdio.c",
        //"src/utils/cst_file_wince.c",
        "src/utils/cst_mmap_none.c",
        "src/utils/cst_mmap_posix.c",
        //"src/utils/cst_mmap_win32.c",
        "src/utils/cst_socket.c",
        "src/utils/cst_string.c",
        "src/utils/cst_tokenstream.c",
        "src/utils/cst_url.c",
        "src/utils/cst_val.c",
        "src/utils/cst_val_const.c",
        "src/utils/cst_val_user.c",
        "src/utils/cst_wchar.c",
        "src/wavesynth/cst_clunits.c",
        "src/wavesynth/cst_diphone.c",
        "src/wavesynth/cst_reflpc.c",
        "src/wavesynth/cst_sigpr.c",
        "src/wavesynth/cst_sts.c",
        "src/wavesynth/cst_units.c",
        }, &.{
        "-DCST_AUDIO_NONE",
        "-DCST_NO_SOCKETS",
    });

const usenglish = b.addStaticLibrary("usenglish", null);
    usenglish.setTarget(target);
    usenglish.setBuildMode(mode);
    usenglish.linkLibC();
    usenglish.addIncludeDir("include");
    usenglish.addCSourceFiles(&.{
        "lang/usenglish/us_aswd.c",
        "lang/usenglish/us_dur_stats.c",
        "lang/usenglish/us_durz_cart.c",
        "lang/usenglish/us_expand.c",
        "lang/usenglish/us_f0_model.c",
        "lang/usenglish/us_f0lr.c",
        "lang/usenglish/us_ffeatures.c",
        "lang/usenglish/us_gpos.c",
        "lang/usenglish/us_int_accent_cart.c",
        "lang/usenglish/us_int_tone_cart.c",
        "lang/usenglish/us_nums_cart.c",
        "lang/usenglish/us_phoneset.c",
        "lang/usenglish/us_phrasing_cart.c",
        "lang/usenglish/us_pos_cart.c",
        "lang/usenglish/us_text.c",
        "lang/usenglish/usenglish.c",
        }, &.{

    });

const cmulex = b.addStaticLibrary("cmulex", null);
    cmulex.setTarget(target);
    cmulex.setBuildMode(mode);
    cmulex.linkLibC();
    cmulex.addIncludeDir("include");
    cmulex.addCSourceFiles(&.{
        "lang/cmulex/cmu_lex.c",
        "lang/cmulex/cmu_lex_data.c",
        "lang/cmulex/cmu_lex_entries.c",
        "lang/cmulex/cmu_lts_model.c",
        "lang/cmulex/cmu_lts_rules.c",
        "lang/cmulex/cmu_postlex.c",
        }, &.{

    });

const awb = b.addStaticLibrary("awb", null);
    awb.setTarget(target);
    awb.setBuildMode(mode);
    awb.linkLibC();
    awb.addIncludeDir("include");
    awb.addIncludeDir("lang/usenglish");
    awb.addIncludeDir("lang/cmulex");
    awb.linkLibrary(usenglish);
    awb.linkLibrary(cmulex);
    awb.addCSourceFiles(&.{
        "lang/cmu_us_awb/cmu_us_awb.c",
        "lang/cmu_us_awb/cmu_us_awb_cg.c",
        "lang/cmu_us_awb/cmu_us_awb_cg_durmodel.c",
        "lang/cmu_us_awb/cmu_us_awb_cg_f0_trees.c",
        "lang/cmu_us_awb/cmu_us_awb_cg_phonestate.c",
        "lang/cmu_us_awb/cmu_us_awb_cg_single_mcep_trees.c",
        "lang/cmu_us_awb/cmu_us_awb_cg_single_params.c",
        "lang/cmu_us_awb/cmu_us_awb_spamf0_accent.c",
        "lang/cmu_us_awb/cmu_us_awb_spamf0_accent_params.c",
        "lang/cmu_us_awb/cmu_us_awb_spamf0_phrase.c",
        }, &.{

    });


    const exe = b.addExecutable("flite", null);
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();
    exe.addIncludeDir("include");
    exe.addCSourceFiles(&.{
        "main/flite_main.c",
        "flite_lang_list.c",
        "flite_voice_list.c",
        }, &.{

    });

    exe.linkLibrary(flite);
    exe.linkLibrary(usenglish);
    exe.linkLibrary(cmulex);
    exe.linkLibrary(awb);

}
