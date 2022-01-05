; ModuleID = 'IR.ll'
source_filename = "first.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"dsin(%f)=%f\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"dex1(%f,%f)=%f\0A\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local double @_Z7sin_fund(double %0) #0 {
  %2 = tail call double @sin(double %0) #8
  ret double %2
}

; Function Attrs: nofree nounwind
declare dso_local double @sin(double) local_unnamed_addr #1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @_Z3ex1dd(double %0, double %1) #2 {
  %3 = fdiv double %1, %0
  %4 = fadd double %3, %0
  %5 = fmul double %0, %1
  %6 = fadd double %5, %0
  %7 = fsub double %0, %1
  %8 = fcmp olt double %7, 4.000000e-01
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = fdiv double 1.000000e+00, %6
  %11 = fadd double %10, 1.000000e+00
  br label %20

12:                                               ; preds = %2
  %13 = fmul double %0, %0
  %14 = fcmp ule double %13, 2.500000e-01
  %15 = fmul double %4, %1
  %16 = fcmp ugt double %15, %13
  %17 = or i1 %14, %16
  %18 = fadd double %5, %4
  %19 = select i1 %17, double %6, double %18
  br label %20

20:                                               ; preds = %12, %9
  %21 = phi double [ %11, %9 ], [ %19, %12 ]
  %22 = fadd double %21, %1
  ret double %22
}

; Function Attrs: uwtable
define dso_local double @_Z8dsin_fund(double %0) local_unnamed_addr #3 {
  %2 = call { double } @diffe_Z7sin_fund(double %0, double 1.000000e+00)
  %3 = extractvalue { double } %2, 0
  ret double %3
}

declare dso_local double @_Z17__enzyme_autodiffPvd(i8*, double) local_unnamed_addr #4

; Function Attrs: uwtable
define dso_local double @_Z8dex1_fundd(double %0, double %1) local_unnamed_addr #3 {
  %3 = call { double, double } @diffe_Z3ex1dd(double %0, double %1, double 1.000000e+00)
  %4 = extractvalue { double, double } %3, 0
  ret double %4
}

declare dso_local double @_Z17__enzyme_autodiffPvdd(i8*, double, double) local_unnamed_addr #4

; Function Attrs: norecurse uwtable
define dso_local i32 @main() local_unnamed_addr #5 {
  br label %2

1:                                                ; preds = %100
  ret i32 0

2:                                                ; preds = %100, %0
  %3 = phi i32 [ 0, %0 ], [ %110, %100 ]
  %4 = phi i64 [ 1, %0 ], [ %88, %100 ]
  %5 = tail call x86_fp80 @logl(x86_fp80 0xK401DFFFFFFFC00000000) #8
  %6 = tail call x86_fp80 @logl(x86_fp80 0xK40008000000000000000) #8
  %7 = fdiv x86_fp80 %5, %6
  %8 = fptoui x86_fp80 %7 to i64
  %9 = add i64 %8, 52
  %10 = udiv i64 %9, %8
  %11 = icmp ugt i64 %10, 1
  %12 = select i1 %11, i64 %10, i64 1
  br label %16

13:                                               ; preds = %16
  %14 = fdiv double %26, %29
  %15 = fcmp ult double %14, 1.000000e+00
  br i1 %15, label %34, label %32, !prof !2, !misexpect !3

16:                                               ; preds = %16, %2
  %17 = phi i64 [ %4, %2 ], [ %22, %16 ]
  %18 = phi i64 [ %12, %2 ], [ %30, %16 ]
  %19 = phi double [ 1.000000e+00, %2 ], [ %29, %16 ]
  %20 = phi double [ 0.000000e+00, %2 ], [ %26, %16 ]
  %21 = mul nsw i64 %17, 16807
  %22 = urem i64 %21, 2147483647
  %23 = add nsw i64 %22, -1
  %24 = uitofp i64 %23 to double
  %25 = fmul double %19, %24
  %26 = fadd double %20, %25
  %27 = fpext double %19 to x86_fp80
  %28 = fmul x86_fp80 %27, 0xK401DFFFFFFFC00000000
  %29 = fptrunc x86_fp80 %28 to double
  %30 = add i64 %18, -1
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %13, label %16

32:                                               ; preds = %13
  %33 = tail call double @nextafter(double 1.000000e+00, double 0.000000e+00) #8
  br label %34

34:                                               ; preds = %32, %13
  %35 = phi double [ %33, %32 ], [ %14, %13 ]
  %36 = fmul double %35, 3.000000e+00
  %37 = tail call x86_fp80 @logl(x86_fp80 0xK401DFFFFFFFC00000000) #8
  %38 = tail call x86_fp80 @logl(x86_fp80 0xK40008000000000000000) #8
  %39 = fdiv x86_fp80 %37, %38
  %40 = fptoui x86_fp80 %39 to i64
  %41 = add i64 %40, 52
  %42 = udiv i64 %41, %40
  %43 = icmp ugt i64 %42, 1
  %44 = select i1 %43, i64 %42, i64 1
  br label %49

45:                                               ; preds = %49
  %46 = fadd double %36, 0.000000e+00
  %47 = fdiv double %59, %62
  %48 = fcmp ult double %47, 1.000000e+00
  br i1 %48, label %67, label %65, !prof !2, !misexpect !3

49:                                               ; preds = %49, %34
  %50 = phi i64 [ %22, %34 ], [ %55, %49 ]
  %51 = phi i64 [ %44, %34 ], [ %63, %49 ]
  %52 = phi double [ 1.000000e+00, %34 ], [ %62, %49 ]
  %53 = phi double [ 0.000000e+00, %34 ], [ %59, %49 ]
  %54 = mul nuw nsw i64 %50, 16807
  %55 = urem i64 %54, 2147483647
  %56 = add nsw i64 %55, -1
  %57 = uitofp i64 %56 to double
  %58 = fmul double %52, %57
  %59 = fadd double %53, %58
  %60 = fpext double %52 to x86_fp80
  %61 = fmul x86_fp80 %60, 0xK401DFFFFFFFC00000000
  %62 = fptrunc x86_fp80 %61 to double
  %63 = add i64 %51, -1
  %64 = icmp eq i64 %63, 0
  br i1 %64, label %45, label %49

65:                                               ; preds = %45
  %66 = tail call double @nextafter(double 1.000000e+00, double 0.000000e+00) #8
  br label %67

67:                                               ; preds = %65, %45
  %68 = phi double [ %66, %65 ], [ %47, %45 ]
  %69 = fmul double %68, 9.000000e-01
  %70 = tail call x86_fp80 @logl(x86_fp80 0xK401DFFFFFFFC00000000) #8
  %71 = tail call x86_fp80 @logl(x86_fp80 0xK40008000000000000000) #8
  %72 = fdiv x86_fp80 %70, %71
  %73 = fptoui x86_fp80 %72 to i64
  %74 = add i64 %73, 52
  %75 = udiv i64 %74, %73
  %76 = icmp ugt i64 %75, 1
  %77 = select i1 %76, i64 %75, i64 1
  br label %82

78:                                               ; preds = %82
  %79 = fadd double %69, 1.000000e-01
  %80 = fdiv double %92, %95
  %81 = fcmp ult double %80, 1.000000e+00
  br i1 %81, label %100, label %98, !prof !2, !misexpect !3

82:                                               ; preds = %82, %67
  %83 = phi i64 [ %55, %67 ], [ %88, %82 ]
  %84 = phi i64 [ %77, %67 ], [ %96, %82 ]
  %85 = phi double [ 1.000000e+00, %67 ], [ %95, %82 ]
  %86 = phi double [ 0.000000e+00, %67 ], [ %92, %82 ]
  %87 = mul nuw nsw i64 %83, 16807
  %88 = urem i64 %87, 2147483647
  %89 = add nsw i64 %88, -1
  %90 = uitofp i64 %89 to double
  %91 = fmul double %85, %90
  %92 = fadd double %86, %91
  %93 = fpext double %85 to x86_fp80
  %94 = fmul x86_fp80 %93, 0xK401DFFFFFFFC00000000
  %95 = fptrunc x86_fp80 %94 to double
  %96 = add i64 %84, -1
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %78, label %82

98:                                               ; preds = %78
  %99 = tail call double @nextafter(double 1.000000e+00, double 0.000000e+00) #8
  br label %100

100:                                              ; preds = %98, %78
  %101 = phi double [ %99, %98 ], [ %80, %78 ]
  %102 = fmul double %101, 9.000000e-01
  %103 = fadd double %102, 1.000000e-01
  %104 = call { double } @diffe_Z7sin_fund(double %46, double 1.000000e+00)
  %105 = extractvalue { double } %104, 0
  %106 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double %46, double %105)
  %107 = call { double, double } @diffe_Z3ex1dd(double %79, double %103, double 1.000000e+00)
  %108 = extractvalue { double, double } %107, 0
  %109 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), double %79, double %103, double %108)
  %110 = add nuw nsw i32 %3, 1
  %111 = icmp eq i32 %110, 100
  br i1 %111, label %1, label %2
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare dso_local double @nextafter(double, double) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare dso_local x86_fp80 @logl(x86_fp80) local_unnamed_addr #1

; Function Attrs: nofree nounwind uwtable
define dso_local double @preprocess__Z7sin_fund(double %0) #0 {
  %2 = tail call double @sin(double %0) #8
  ret double %2
}

; Function Attrs: nofree nounwind uwtable
define internal { double } @diffe_Z7sin_fund(double %0, double %differeturn) #0 {
  %"'de" = alloca double, align 8
  store double 0.000000e+00, double* %"'de"
  %"'de1" = alloca double, align 8
  store double 0.000000e+00, double* %"'de1"
  %2 = tail call double @sin(double %0) #8
  br label %invert

invert:                                           ; preds = %1
  store double %differeturn, double* %"'de"
  %3 = load double, double* %"'de"
  store double 0.000000e+00, double* %"'de"
  %4 = call fast double @llvm.cos.f64(double %0)
  %5 = fmul fast double %3, %4
  %6 = load double, double* %"'de1"
  %7 = fadd fast double %6, %5
  store double %7, double* %"'de1"
  %8 = load double, double* %"'de1"
  %9 = insertvalue { double } undef, double %8, 0
  ret { double } %9
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.cos.f64(double) #7

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local double @preprocess__Z3ex1dd(double %0, double %1) #2 {
  %3 = fdiv double %1, %0
  %4 = fadd double %3, %0
  %5 = fmul double %0, %1
  %6 = fadd double %5, %0
  %7 = fsub double %0, %1
  %8 = fcmp olt double %7, 4.000000e-01
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = fdiv double 1.000000e+00, %6
  %11 = fadd double %10, 1.000000e+00
  br label %20

12:                                               ; preds = %2
  %13 = fmul double %0, %0
  %14 = fcmp ule double %13, 2.500000e-01
  %15 = fmul double %4, %1
  %16 = fcmp ugt double %15, %13
  %17 = or i1 %14, %16
  %18 = fadd double %5, %4
  %19 = select i1 %17, double %6, double %18
  br label %20

20:                                               ; preds = %12, %9
  %21 = phi double [ %11, %9 ], [ %19, %12 ]
  %22 = fadd double %21, %1
  ret double %22
}

; Function Attrs: norecurse nounwind readnone uwtable
define internal { double, double } @diffe_Z3ex1dd(double %0, double %1, double %differeturn) #2 {
  %"'de" = alloca double, align 8
  store double 0.000000e+00, double* %"'de"
  %"'de4" = alloca double, align 8
  store double 0.000000e+00, double* %"'de4"
  %"'de5" = alloca double, align 8
  store double 0.000000e+00, double* %"'de5"
  %"'de6" = alloca double, align 8
  store double 0.000000e+00, double* %"'de6"
  %"'de7" = alloca double, align 8
  store double 0.000000e+00, double* %"'de7"
  %"'de8" = alloca double, align 8
  store double 0.000000e+00, double* %"'de8"
  %"'de9" = alloca double, align 8
  store double 0.000000e+00, double* %"'de9"
  %"'de10" = alloca double, align 8
  store double 0.000000e+00, double* %"'de10"
  %"'de11" = alloca double, align 8
  store double 0.000000e+00, double* %"'de11"
  %"'de13" = alloca double, align 8
  store double 0.000000e+00, double* %"'de13"
  %"'de20" = alloca double, align 8
  store double 0.000000e+00, double* %"'de20"
  %"'de23" = alloca double, align 8
  store double 0.000000e+00, double* %"'de23"
  %3 = fdiv double %1, %0
  %4 = fadd double %3, %0
  %5 = fmul double %0, %1
  %6 = fadd double %5, %0
  %7 = fsub double %0, %1
  %8 = fcmp olt double %7, 4.000000e-01
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = fdiv double 1.000000e+00, %6
  br label %17

11:                                               ; preds = %2
  %12 = fmul double %0, %0
  %13 = fcmp ule double %12, 2.500000e-01
  %14 = fmul double %4, %1
  %15 = fcmp ugt double %14, %12
  %16 = or i1 %13, %15
  br label %17

17:                                               ; preds = %11, %9
  br label %invert3

invert:                                           ; preds = %invert2, %invert1
  %18 = load double, double* %"'de4"
  store double 0.000000e+00, double* %"'de4"
  %19 = load double, double* %"'de5"
  %20 = fadd fast double %19, %18
  store double %20, double* %"'de5"
  %21 = load double, double* %"'de6"
  %22 = fadd fast double %21, %18
  store double %22, double* %"'de6"
  %23 = load double, double* %"'de5"
  %m0diffe = fmul fast double %23, %1
  %m1diffe = fmul fast double %23, %0
  store double 0.000000e+00, double* %"'de5"
  %24 = load double, double* %"'de6"
  %25 = fadd fast double %24, %m0diffe
  store double %25, double* %"'de6"
  %26 = load double, double* %"'de7"
  %27 = fadd fast double %26, %m1diffe
  store double %27, double* %"'de7"
  %28 = load double, double* %"'de8"
  store double 0.000000e+00, double* %"'de8"
  %29 = load double, double* %"'de9"
  %30 = fadd fast double %29, %28
  store double %30, double* %"'de9"
  %31 = load double, double* %"'de6"
  %32 = fadd fast double %31, %28
  store double %32, double* %"'de6"
  %33 = load double, double* %"'de9"
  %d0diffe = fdiv fast double %33, %0
  %34 = fdiv fast double %33, %0
  %35 = fmul fast double %3, %34
  %36 = fneg fast double %35
  store double 0.000000e+00, double* %"'de9"
  %37 = load double, double* %"'de7"
  %38 = fadd fast double %37, %d0diffe
  store double %38, double* %"'de7"
  %39 = load double, double* %"'de6"
  %40 = fadd fast double %39, %36
  store double %40, double* %"'de6"
  %41 = load double, double* %"'de6"
  %42 = load double, double* %"'de7"
  %43 = insertvalue { double, double } undef, double %41, 0
  %44 = insertvalue { double, double } %43, double %42, 1
  ret { double, double } %44

invert1:                                          ; preds = %invert3
  %45 = load double, double* %"'de10"
  store double 0.000000e+00, double* %"'de10"
  %46 = load double, double* %"'de11"
  %47 = fadd fast double %46, %45
  store double %47, double* %"'de11"
  %48 = load double, double* %"'de11"
  %_unwrap = fdiv double 1.000000e+00, %6
  %49 = fdiv fast double %48, %6
  %50 = fmul fast double %_unwrap, %49
  %51 = fneg fast double %50
  store double 0.000000e+00, double* %"'de11"
  %52 = load double, double* %"'de4"
  %53 = fadd fast double %52, %51
  store double %53, double* %"'de4"
  br label %invert

invert2:                                          ; preds = %invert3
  %54 = load double, double* %"'de13"
  %_unwrap14 = fmul double %0, %0
  %_unwrap15 = fcmp ule double %_unwrap14, 2.500000e-01
  %_unwrap16 = fmul double %4, %1
  %_unwrap17 = fcmp ugt double %_unwrap16, %_unwrap14
  %_unwrap18 = or i1 %_unwrap15, %_unwrap17
  %diffe = select fast i1 %_unwrap18, double %54, double 0.000000e+00
  %55 = load double, double* %"'de13"
  %diffe19 = select fast i1 %_unwrap18, double 0.000000e+00, double %55
  store double 0.000000e+00, double* %"'de13"
  %56 = load double, double* %"'de4"
  %57 = fadd fast double %56, %54
  %58 = select fast i1 %_unwrap18, double %57, double %56
  store double %58, double* %"'de4"
  %59 = load double, double* %"'de20"
  %60 = fadd fast double %59, %55
  %61 = select fast i1 %_unwrap18, double %59, double %60
  store double %61, double* %"'de20"
  %62 = load double, double* %"'de20"
  store double 0.000000e+00, double* %"'de20"
  %63 = load double, double* %"'de5"
  %64 = fadd fast double %63, %62
  store double %64, double* %"'de5"
  %65 = load double, double* %"'de8"
  %66 = fadd fast double %65, %62
  store double %66, double* %"'de8"
  br label %invert

invert3:                                          ; preds = %17
  store double %differeturn, double* %"'de"
  %67 = load double, double* %"'de"
  store double 0.000000e+00, double* %"'de"
  %68 = load double, double* %"'de23"
  %69 = fadd fast double %68, %67
  store double %69, double* %"'de23"
  %70 = load double, double* %"'de7"
  %71 = fadd fast double %70, %67
  store double %71, double* %"'de7"
  %72 = load double, double* %"'de23"
  store double 0.000000e+00, double* %"'de23"
  %73 = xor i1 %8, true
  %74 = select fast i1 %73, double %72, double 0.000000e+00
  %75 = load double, double* %"'de13"
  %76 = fadd fast double %75, %72
  %77 = select fast i1 %8, double %75, double %76
  store double %77, double* %"'de13"
  %78 = select fast i1 %8, double %72, double 0.000000e+00
  %79 = load double, double* %"'de10"
  %80 = fadd fast double %79, %72
  %81 = select fast i1 %8, double %80, double %79
  store double %81, double* %"'de10"
  br i1 %8, label %invert1, label %invert2
}

attributes #0 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone speculatable willreturn }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!2 = !{!"branch_weights", i32 2000, i32 1}
!3 = !{!"misexpect", i64 1, i64 2000, i64 1}
