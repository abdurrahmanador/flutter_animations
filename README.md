# Flutter Animations Learning Series

This repository documents my structured journey to deeply understand Flutter animations from first principles.  
Instead of copying animation code, the goal is to understand how Flutter animations actually work internally, why certain APIs exist, and how to write performant, production-quality animation code.

Each class is pushed separately to Git to track learning progress step by step.

This is not about fancy UI effects.  
This is about mastering the animation system so complex UI motion becomes predictable, debuggable, and scalable.

---

## Class 1: Animation Fundamentals

In this class, the focus is on understanding what an animation really is in Flutter.

Core concepts covered:

1. Understanding animation as value changes over time rather than visual effects
2. AnimationController and how it controls animation timeline
3. Tween and mapping controller progress to UI values
4. The meaning of `animation.value`
5. Using `SingleTickerProviderStateMixin` and why `vsync` is necessary
6. Using `addListener` with `setState` for basic animations
7. Understanding the cascade operator `..` in Dart

---

## Class 2: AnimatedBuilder and Optimized Animations

In this class, the focus is on writing efficient animations and separating static and dynamic parts of the UI.

Core concepts covered:

1. Problems with `addListener + setState` and full widget rebuilds
2. Using `AnimatedBuilder` to rebuild only animated widgets
3. Understanding `builder: (context, child)` parameters
4. Using the `child` parameter to optimize performance for static widgets
5. When and why to use `const` widgets inside animations
6. Proper disposal of AnimationController to prevent resource leaks
