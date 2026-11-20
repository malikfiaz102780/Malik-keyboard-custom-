#!/usr/bin/env bash
set -e

mkdir -p app/src/main/java/com/malikfiaz/customkeyboard
mkdir -p app/src/main/res/layout
mkdir -p app/src/main/res/xml
mkdir -p app/src/main/res/values

cat << 'EOF' > settings.gradle
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "MalikCustomKeyboard"
include ':app'
EOF

cat << 'EOF' > build.gradle
plugins {
    id 'com.android.application' version '8.3.2' apply false
}
EOF

cat << 'EOF' > gradle.properties
org.gradle.jvmargs=-Xmx2048m -Dfile.encoding=UTF-8
android.useAndroidX=true
EOF

cat << 'EOF' > app/build.gradle
plugins {
    id 'com.android.application'
}

android {
    namespace 'com.malikfiaz.customkeyboard'
    compileSdk 34

    defaultConfig {
        applicationId "com.malikfiaz.customkeyboard"
        minSdk 24
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }

    buildTypes {
        release {
            minifyEnabled false
        }
    }

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
}

dependencies {
}
EOF

cat << 'EOF' > app/src/main/AndroidManifest.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application
        android:allowBackup="true"
        android:label="Malik Keyboard"
        android:supportsRtl="true"
        android:theme="@android:style/Theme.DeviceDefault.NoActionBar">

        <service
            android:name=".MyCustomKeyboardService"
            android:exported="true"
            android:label="Malik Custom Keyboard"
            android:permission="android.permission.BIND_INPUT_METHOD">
            <intent-filter>
                <action android:name="android.view.InputMethod" />
            </intent-filter>

            <meta-data
                android:name="android.view.im"
                android:resource="@xml/method" />
        </service>

    </application>
</manifest>
EOF

cat << 'EOF' > app/src/main/res/xml/method.xml
<?xml version="1.0" encoding="utf-8"?>
<input-method xmlns:android="http://schemas.android.com/apk/res/android"
    android:isDefault="false" />
EOF

cat << 'EOF' > app/src/main/res/values/styles.xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="KeyBtn">
        <item name="android:layout_width">0dp</item>
        <item name="android:layout_height">match_parent</item>
        <item name="android:layout_weight">1</item>
        <item name="android:layout_margin">2dp</item>
        <item name="android:textColor">#FFFFFF</item>
        <item name="android:textSize">15sp</item>
    </style>

    <style name="ActBtn" parent="KeyBtn">
        <item name="android:textSize">11sp</item>
    </style>
</resources>
EOF

cat << 'EOF' > app/src/main/res/layout/keyboard_layout.xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/keyboardRoot"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="#090D16"
    android:orientation="vertical"
    android:padding="6dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="42dp"
        android:gravity="center_vertical"
        android:orientation="horizontal"
        android:paddingHorizontal="4dp">

        <TextView
            android:id="@+id/brandBanner"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="MALIK FIAZ • CYBER KEYBOARD"
            android:textColor="#38BDF8"
            android:textSize="12sp"
            android:textStyle="bold" />

        <Button
            android:id="@+id/btnTheme"
            android:layout_width="wrap_content"
            android:layout_height="34dp"
            android:layout_marginEnd="4dp"
            android:text="CYBER"
            android:textColor="#FFFFFF"
            android:textSize="10sp" />

        <Button
            android:id="@+id/btnLang"
            android:layout_width="wrap_content"
            android:layout_height="34dp"
            android:text="EN"
            android:textColor="#FFFFFF"
            android:textSize="11sp" />
    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="46dp"
        android:orientation="horizontal">
        <Button style="@style/KeyBtn" android:text="q" />
        <Button style="@style/KeyBtn" android:text="w" />
        <Button style="@style/KeyBtn" android:text="e" />
        <Button style="@style/KeyBtn" android:text="r" />
        <Button style="@style/KeyBtn" android:text="t" />
        <Button style="@style/KeyBtn" android:text="y" />
        <Button style="@style/KeyBtn" android:text="u" />
        <Button style="@style/KeyBtn" android:text="i" />
        <Button style="@style/KeyBtn" android:text="o" />
        <Button style="@style/KeyBtn" android:text="p" />
    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="46dp"
        android:orientation="horizontal">
        <Button style="@style/KeyBtn" android:text="a" />
        <Button style="@style/KeyBtn" android:text="s" />
        <Button style="@style/KeyBtn" android:text="d" />
        <Button style="@style/KeyBtn" android:text="f" />
        <Button style="@style/KeyBtn" android:text="g" />
        <Button style="@style/KeyBtn" android:text="h" />
        <Button style="@style/KeyBtn" android:text="j" />
        <Button style="@style/KeyBtn" android:text="k" />
        <Button style="@style/KeyBtn" android:text="l" />
    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="46dp"
        android:orientation="horizontal">
        <Button android:id="@+id/btnShift" style="@style/ActBtn" android:text="⇧" />
        <Button style="@style/KeyBtn" android:text="z" />
        <Button style="@style/KeyBtn" android:text="x" />
        <Button style="@style/KeyBtn" android:text="c" />
        <Button style="@style/KeyBtn" android:text="v" />
        <Button style="@style/KeyBtn" android:text="b" />
        <Button style="@style/KeyBtn" android:text="n" />
        <Button style="@style/KeyBtn" android:text="m" />
        <Button android:id="@+id/btnDel" style="@style/ActBtn" android:text="⌫" />
    </LinearLayout>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="46dp"
        android:orientation="horizontal">
        <Button android:id="@+id/btn123" style="@style/ActBtn" android:text="?123" />
        <Button android:id="@+id/btnSpace" style="@style/KeyBtn" android:layout_weight="4" android:text="Malik Keyboard" />
        <Button android:id="@+id/btnEnter" style="@style/ActBtn" android:text="↵" />
    </LinearLayout>

</LinearLayout>
EOF

cat << 'EOF' > app/src/main/java/com/malikfiaz/customkeyboard/MyCustomKeyboardService.java
package com.malikfiaz.customkeyboard;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.inputmethodservice.InputMethodService;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;
import android.widget.Button;
import android.widget.TextView;

public class MyCustomKeyboardService extends InputMethodService {

    private boolean upper = false;
    private int langIdx = 0;
    private int themeIdx = 0;

    private final String[] langs = {"EN", "UR", "AR", "HI"};
    private final String[] themes = {"CYBER", "NEON", "MATRIX", "CRIMSON"};

    private final int[] accents = {
        Color.parseColor("#38BDF8"),
        Color.parseColor("#E879F9"),
        Color.parseColor("#4ADE80"),
        Color.parseColor("#FB7185")
    };

    private final int[] keyBgs = {
        Color.parseColor("#1E293B"),
        Color.parseColor("#3B0764"),
        Color.parseColor("#064E3B"),
        Color.parseColor("#4C0519")
    };

    private final int[] movingColors = {
        Color.parseColor("#09192F"),
        Color.parseColor("#1D1147"),
        Color.parseColor("#380E3F"),
        Color.parseColor("#471026"),
        Color.parseColor("#3B1F0B"),
        Color.parseColor("#092E26"),
        Color.parseColor("#09192F")
    };

    private final String[][] en = {
        {"q","w","e","r","t","y","u","i","o","p"},
        {"a","s","d","f","g","h","j","k","l"},
        {"z","x","c","v","b","n","m"}
    };

    private final String[][] ur = {
        {"ق","و","ع","ر","ت","ے","ء","ی","ہ","پ"},
        {"ا","س","د","ف","گ","ح","ج","ک","ل"},
        {"ز","ش","چ","ط","ب","ن","م"}
    };

    private final String[][] ar = {
        {"ض","ص","ث","ق","ف","غ","ع","ه","خ","ح"},
        {"ش","س","ي","ب","ل","ا","ت","ن","م"},
        {"ئ","ء","ؤ","ر","لا","ى","ة"}
    };

    private final String[][] hi = {
        {"ौ","ै","ा","ी","ू","ब","ह","ग","द","ज"},
        {"ो","े","्","ि","ु","प","र","क","त"},
        {"ं","म","न","व","ल","स","य"}
    };

    private ValueAnimator bgAnimator;
    private ValueAnimator borderAnimator;
    private int currentKeyBg = Color.parseColor("#1E293B");

    @Override
    public View onCreateInputView() {
        View v = getLayoutInflater().inflate(R.layout.keyboard_layout, null);
        setup(v);
        applyTheme(v);
        startMovingColors(v);
        applyKeys(v);
        return v;
    }

    @Override
    public void onFinishInputView(boolean finishingInput) {
        super.onFinishInputView(finishingInput);
        if (bgAnimator != null && bgAnimator.isRunning()) bgAnimator.pause();
        if (borderAnimator != null && borderAnimator.isRunning()) borderAnimator.pause();
    }

    @Override
    public void onStartInputView(android.view.inputmethod.EditorInfo info, boolean restarting) {
        super.onStartInputView(info, restarting);
        if (bgAnimator != null && bgAnimator.isPaused()) bgAnimator.resume();
        if (borderAnimator != null && borderAnimator.isPaused()) borderAnimator.resume();
    }

    private void startMovingColors(View root) {
        if (bgAnimator != null) bgAnimator.cancel();
        bgAnimator = ValueAnimator.ofObject(
            new ArgbEvaluator(),
            movingColors[0],
            movingColors[1],
            movingColors[2],
            movingColors[3],
            movingColors[4],
            movingColors[5],
            movingColors[6]
        );
        bgAnimator.setDuration(6000);
        bgAnimator.setRepeatCount(ValueAnimator.INFINITE);
        bgAnimator.setRepeatMode(ValueAnimator.RESTART);
        bgAnimator.addUpdateListener(a -> {
            int color = (int) a.getAnimatedValue();
            root.setBackgroundColor(color);
        });
        bgAnimator.start();

        if (borderAnimator != null) borderAnimator.cancel();
        borderAnimator = ValueAnimator.ofObject(
            new ArgbEvaluator(),
            Color.parseColor("#38BDF8"),
            Color.parseColor("#E879F9"),
            Color.parseColor("#F43F5E"),
            Color.parseColor("#FBBF24"),
            Color.parseColor("#22C55E"),
            Color.parseColor("#38BDF8")
        );
        borderAnimator.setDuration(4500);
        borderAnimator.setRepeatCount(ValueAnimator.INFINITE);
        borderAnimator.setRepeatMode(ValueAnimator.RESTART);
        borderAnimator.addUpdateListener(a -> {
            int glow = (int) a.getAnimatedValue();
            if (root instanceof ViewGroup) {
                updateKeyGlow((ViewGroup) root, currentKeyBg, glow);
            }
        });
        borderAnimator.start();
    }

    private void updateKeyGlow(ViewGroup group, int keyBg, int glowColor) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ViewGroup) {
                updateKeyGlow((ViewGroup) child, keyBg, glowColor);
            } else if (child instanceof Button) {
                Button b = (Button) child;
                GradientDrawable gd = new GradientDrawable();
                gd.setColor(keyBg);
                gd.setCornerRadius(14f);
                gd.setStroke(2, glowColor);
                b.setBackground(gd);
                b.setTextColor(Color.WHITE);
            }
        }
    }

    private void applyTheme(View v) {
        int acc = accents[themeIdx];
        currentKeyBg = keyBgs[themeIdx];

        TextView b = v.findViewById(R.id.brandBanner);
        if (b != null) {
            b.setTextColor(acc);
            b.setText("MALIK FIAZ • " + themes[themeIdx] + " KEYBOARD");
        }

        Button bt = v.findViewById(R.id.btnTheme);
        if (bt != null) {
            bt.setText(themes[themeIdx]);
        }

        if (v instanceof ViewGroup) {
            updateKeyGlow((ViewGroup) v, currentKeyBg, acc);
        }
    }

    private void setup(View v) {
        Button bt = v.findViewById(R.id.btnTheme);
        if (bt != null) {
            bt.setOnClickListener(x -> {
                themeIdx = (themeIdx + 1) % themes.length;
                applyTheme(v);
            });
        }

        Button bl = v.findViewById(R.id.btnLang);
        if (bl != null) {
            bl.setOnClickListener(x -> {
                langIdx = (langIdx + 1) % langs.length;
                bl.setText(langs[langIdx]);
                applyKeys(v);
            });
        }

        Button bs = v.findViewById(R.id.btnShift);
        if (bs != null) {
            bs.setOnClickListener(x -> {
                upper = !upper;
                applyKeys(v);
            });
        }

        Button bd = v.findViewById(R.id.btnDel);
        if (bd != null) {
            bd.setOnClickListener(x -> {
                InputConnection ic = getCurrentInputConnection();
                if (ic != null) ic.deleteSurroundingText(1, 0);
            });
        }

        Button bsp = v.findViewById(R.id.btnSpace);
        if (bsp != null) {
            bsp.setOnClickListener(x -> commit(" "));
        }

        Button be = v.findViewById(R.id.btnEnter);
        if (be != null) {
            be.setOnClickListener(x -> {
                InputConnection ic = getCurrentInputConnection();
                if (ic != null) {
                    ic.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_ENTER));
                    ic.sendKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_ENTER));
                }
            });
        }
    }

    private void applyKeys(View v) {
        String[][] src = "UR".equals(langs[langIdx]) ? ur :
            ("AR".equals(langs[langIdx]) ? ar :
            ("HI".equals(langs[langIdx]) ? hi : en));

        String[] all = new String[src[0].length + src[1].length + src[2].length];
        System.arraycopy(src[0], 0, all, 0, src[0].length);
        System.arraycopy(src[1], 0, all, src[0].length, src[1].length);
        System.arraycopy(src[2], 0, all, src[0].length + src[1].length, src[2].length);

        if (v instanceof ViewGroup) {
            assign((ViewGroup) v, all, new int[]{0});
        }
    }

    private void assign(ViewGroup g, String[] letters, int[] idx) {
        for (int i = 0; i < g.getChildCount(); i++) {
            View c = g.getChildAt(i);
            if (c instanceof ViewGroup) {
                assign((ViewGroup) c, letters, idx);
            } else if (c instanceof Button) {
                Button b = (Button) c;
                int id = b.getId();
                if (id != R.id.btnTheme && id != R.id.btnLang && id != R.id.btnShift &&
                    id != R.id.btnDel && id != R.id.btn123 && id != R.id.btnSpace &&
                    id != R.id.btnEnter && idx[0] < letters.length) {
                    String val = letters[idx[0]++];
                    if ("EN".equals(langs[langIdx]) && upper) {
                        val = val.toUpperCase();
                    }
                    b.setText(val);
                    final String fv = val;
                    b.setOnClickListener(x -> commit(fv));
                }
            }
        }
    }

    private void commit(String t) {
        InputConnection ic = getCurrentInputConnection();
        if (ic != null) ic.commitText(t, 1);
    }
}
EOF
