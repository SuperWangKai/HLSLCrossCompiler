//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
//
//   fxc /T ps_4_0 /Fo RaycastTerrainShootRayPS.o /Fc
//    RaycastTerrainShootRayPS.asm /E ShootRayPS RaycastTerrain.fx
//
//
// Buffer Definitions: 
//
// cbuffer $Params
// {
//
//   bool bOutside;                     // Offset:    0 Size:     4
//   bool bDetail;                      // Offset:    4 Size:     4
//   bool bShadow;                      // Offset:    8 Size:     4
//   bool bOrtho;                       // Offset:   12 Size:     4
//
// }
//
// cbuffer cbOnRender
// {
//
//   float3 g_LightDir;                 // Offset:    0 Size:    12
//   float3 g_LightDirTex;              // Offset:   16 Size:    12
//   float4 g_LightDiffuse;             // Offset:   32 Size:    16 [unused]
//   float4x4 g_mWorldViewProjection;   // Offset:   48 Size:    64 [unused]
//   float4x4 g_mWorld;                 // Offset:  112 Size:    64 [unused]
//   float3 g_vTextureEyePt;            // Offset:  176 Size:    12
//   float4x4 g_mWorldToTerrain;        // Offset:  192 Size:    64 [unused]
//   float4x4 g_mTexToViewProj;         // Offset:  256 Size:    64
//   float4x4 g_mLightViewProj;         // Offset:  320 Size:    64 [unused]
//   float4x4 g_mTexToLightViewProj;    // Offset:  384 Size:    64
//
// }
//
// cbuffer cbConstant
// {
//
//   float g_InvMapSize;                // Offset:    0 Size:     4
//      = 0x3a800000 
//   float g_MapSize;                   // Offset:    4 Size:     4 [unused]
//      = 0x44800000 
//   float g_InvDetailMapSize;          // Offset:    8 Size:     4
//      = 0x3b800000 
//   float g_DetailMapSize;             // Offset:   12 Size:     4
//      = 0x43800000 
//   float g_HeightRatio;               // Offset:   16 Size:     4
//      = 0x3dcccccd 
//
// }
//
// cbuffer cbUI
// {
//
//   float g_DetailRepeat;              // Offset:    0 Size:     4
//      = 0x41800000 
//   float g_InvDetailRepeat;           // Offset:    4 Size:     4
//      = 0x3d800000 
//   float g_DetailHeight;              // Offset:    8 Size:     4
//      = 0x3dcccccd 
//   float g_ShadowBias;                // Offset:   12 Size:     4
//      = 0x3c23d70a 
//   float g_DetailDistanceSq;          // Offset:   16 Size:     4
//      = 0x3f800000 
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// g_samLinearPoint                  sampler      NA          NA    0        1
// g_samWrap                         sampler      NA          NA    1        1
// g_samComparison                 sampler_c      NA          NA    2        1
// g_txDetailDiffuse                 texture  float4          2d    0        4
// g_txDetailGrad_RedGreen           texture  float4          2d    4        1
// g_txDetailGrad_BlueAlpha          texture  float4          2d    5        1
// g_txHeight                        texture  float4          2d    6        1
// g_txMask                          texture  float4          2d    7        1
// g_txDetailHeight                  texture  float4          2d    8        1
// g_txDepthMap                      texture  float4          2d    9        1
// $Params                           cbuffer      NA          NA    0        1
// cbOnRender                        cbuffer      NA          NA    1        1
// cbConstant                        cbuffer      NA          NA    2        1
// cbUI                              cbuffer      NA          NA    3        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// RAYEND                   0   xyz         0     NONE  float   xyz 
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// SV_TARGET                0   xyzw        0   TARGET  float   xyzw
// SV_DEPTH                 0    N/A   oDepth    DEPTH  float    YES
//
ps_4_0
dcl_constantbuffer cb0[1], immediateIndexed
dcl_constantbuffer cb1[28], immediateIndexed
dcl_constantbuffer cb2[2], immediateIndexed
dcl_constantbuffer cb3[2], immediateIndexed
dcl_sampler s0, mode_default
dcl_sampler s1, mode_default
dcl_sampler s2, mode_comparison
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t1
dcl_resource_texture2d (float,float,float,float) t2
dcl_resource_texture2d (float,float,float,float) t3
dcl_resource_texture2d (float,float,float,float) t4
dcl_resource_texture2d (float,float,float,float) t5
dcl_resource_texture2d (float,float,float,float) t6
dcl_resource_texture2d (float,float,float,float) t7
dcl_resource_texture2d (float,float,float,float) t8
dcl_resource_texture2d (float,float,float,float) t9
dcl_input_ps linear v0.xyz
dcl_output o0.xyzw
dcl_output oDepth
dcl_temps 16
mad r0.xyz, cb1[1].xyzx, l(2.000000, 2.000000, 2.000000, 0.000000), v0.xyzx
movc r0.xyz, cb0[0].wwww, r0.xyzx, cb1[11].xzyx
add r1.xyz, -r0.xyzx, v0.xyzx
lt r2.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r1.xyzx
div r3.xyz, -r0.xyzx, r1.xyzx
max r0.w, r3.x, l(-1.000000)
movc r0.w, r2.x, r0.w, l(-1.000000)
lt r4.xyz, r1.xyzx, l(0.000000, 0.000000, 0.000000, 0.000000)
add r5.xyz, -r0.xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
div r5.xyz, r5.xyzx, r1.xyzx
max r1.w, r0.w, r5.x
movc r0.w, r4.x, r1.w, r0.w
max r1.w, r0.w, r3.y
movc r0.w, r2.y, r1.w, r0.w
max r1.w, r0.w, r5.y
movc r0.w, r4.y, r1.w, r0.w
max r1.w, r0.w, r3.z
movc r0.w, r2.z, r1.w, r0.w
max r1.w, r0.w, r5.z
movc r0.w, r4.z, r1.w, r0.w
mad r2.xyz, r1.xyzx, r0.wwww, r0.xyzx
add r3.xyz, -r2.xyzx, v0.xyzx
movc r2.xyz, cb0[0].xxxx, r2.xyzx, r0.xyzx
movc r1.xyz, cb0[0].xxxx, r3.xyzx, r1.xyzx
dp3 r0.w, r1.xyzx, r1.xyzx
sqrt r0.w, r0.w
div r1.xyz, r1.xyzx, r0.wwww
mad r1.w, -r1.z, r1.z, l(1.000000)
sqrt r1.w, r1.w
sample_l r3.xyzw, r2.xyxx, t6.xyzw, s0, l(0.000000)
mov r4.xyz, r2.xyzx
mov r7.y, l(0)
mov r6.xyzw, r3.zwxy
mov r2.w, l(0)
mov r4.w, l(0)
mov r5.xyw, l(0,0,0,0)
mov r8.x, l(0)
loop 
  ge r8.y, r6.z, r4.z
  mov r8.x, l(0)
  breakc_nz r8.y
  mul r8.y, r6.w, r6.w
  div r8.y, r1.w, r8.y
  add r8.y, -r1.z, r8.y
  div r8.y, l(1.000000, 1.000000, 1.000000, 1.000000), r8.y
  add r8.z, r4.z, -r6.z
  mul r8.y, r8.y, r8.z
  max r8.y, r8.y, cb2[0].x
  add r2.w, r2.w, r8.y
  mad r9.xyz, r1.xyzx, r8.yyyy, r4.xyzx
  lt r8.z, r0.w, r2.w
  if_nz r8.z
    mov r5.xy, l(-1.000000,-1.000000,0,0)
    mov r4.xyz, r9.xyzx
    mov r7.y, l(-1.000000)
    mov r4.w, r8.y
    mov r8.x, l(-1)
    break 
  endif 
  ilt r8.w, l(512), r5.w
  if_nz r8.w
    mov r5.xy, l(-1.000000,-1.000000,0,0)
    mov r4.xyz, r9.xyzx
    mov r7.y, l(-1.000000)
    mov r4.w, r8.y
    mov r8.x, l(-1)
    break 
  endif 
  sample_l r6.xyzw, r9.xyxx, t6.zwxy, s0, l(0.000000)
  iadd r5.w, r5.w, l(1)
  or r8.x, r8.z, r8.w
  mov r4.xyz, r9.xyzx
  mov r4.w, r8.y
  mov r5.xy, l(0,0,0,0)
  mov r7.y, l(0)
endloop 
if_z r8.x
  if_nz cb0[0].y
    add r0.xyz, -r0.xyzx, r4.xyzx
    mul r0.w, r0.z, cb2[1].x
    dp3 r0.x, r0.xywx, r0.xywx
    lt r0.x, r0.x, cb3[1].x
    if_nz r0.x
      mad r0.yzw, -r4.wwww, r1.xxyz, r4.xxyz
      add r2.xyz, -r0.yzwy, v0.xyzx
      dp3 r1.w, r2.xyzx, r2.xyzx
      sqrt r1.w, r1.w
      div r2.xyz, r2.xyzx, r1.wwww
      sample_l r3.xyzw, r0.yzyy, t6.xyzw, s0, l(0.000000)
      sample_l r8.xyzw, r0.yzyy, t7.xyzw, s0, l(0.000000)
      mul r9.xy, r0.yzyy, cb3[0].xxxx
      sample_l r9.xyzw, r9.xyxx, t8.xyzw, s1, l(0.000000)
      dp4 r2.w, r9.xyzw, r8.xyzw
      add r2.w, -r2.w, l(1.000000)
      mad r2.w, -r2.w, cb3[0].z, r3.x
      mul r3.x, cb2[0].z, cb3[0].y
      mul r3.y, r3.x, l(4.000000)
      mul r9.xyz, r2.xyzx, r3.yyyy
      mov r10.xyzw, r8.xyzw
      mov r7.xyz, l(0,0,0,0)
      mov r12.xy, r6.xyxx
      mov r13.xy, r3.zwzz
      mov r11.xyz, r0.yzwy
      mov r5.w, r2.w
      mov r6.w, l(0)
      mov r9.w, l(0)
      mov r11.w, l(0)
      loop 
        ge r12.z, r5.w, r11.z
        mov r11.w, l(0)
        breakc_nz r12.z
        mad r6.w, r3.x, l(4.000000), r6.w
        mad r14.xyz, r2.xyzx, r3.yyyy, r11.xyzx
        lt r12.z, r1.w, r6.w
        ilt r12.w, l(128), r9.w
        or r12.z, r12.w, r12.z
        if_nz r12.z
          mov r7.xyz, r14.xzyx
          mov r12.xy, r13.xyxx
          mov r11.xyz, r14.xyzx
          mov r11.w, l(-1)
          break 
        endif 
        sample_l r13.xyzw, r14.xyxx, t6.zwxy, s0, l(0.000000)
        sample_l r10.xyzw, r14.xyxx, t7.xyzw, s0, l(0.000000)
        mul r15.xy, r14.xyxx, cb3[0].xxxx
        sample_l r15.xyzw, r15.xyxx, t8.xyzw, s1, l(0.000000)
        dp4 r12.w, r15.xyzw, r10.xyzw
        add r12.w, -r12.w, l(1.000000)
        mad r5.w, -r12.w, cb3[0].z, r13.z
        iadd r9.w, r9.w, l(1)
        mov r11.xyz, r14.xyzx
        mov r11.w, r12.z
        mov r7.xyz, l(0,0,0,0)
      endloop 
      mov r6.xy, r12.xyxx
      if_z r11.w
        mad r0.yzw, -r2.xxyz, r3.yyyy, r11.xxyz
        mov r2.xyzw, r10.xyzw
        mov r7.xyz, r11.xzyx
        mov r6.xy, r13.xyxx
        mov r6.z, l(0.500000)
        mov r1.w, l(0.250000)
        mov r3.x, l(0)
        loop 
          ige r3.y, r3.x, l(8)
          breakc_nz r3.y
          mad r3.yzw, r6.zzzz, r9.xxyz, r0.yyzw
          sample_l r8.xyzw, r3.yzyy, t6.zwxy, s0, l(0.000000)
          sample_l r12.xyzw, r3.yzyy, t7.xyzw, s0, l(0.000000)
          mul r13.zw, r3.yyyz, cb3[0].xxxx
          sample_l r14.xyzw, r13.zwzz, t8.xyzw, s1, l(0.000000)
          dp4 r5.w, r14.xyzw, r12.xyzw
          add r5.w, -r5.w, l(1.000000)
          mad r5.w, -r5.w, cb3[0].z, r8.z
          ge r5.w, r5.w, r3.w
          mad r8.z, -r1.w, l(2.000000), r6.z
          movc r2.xyzw, r5.wwww, r12.xyzw, r2.xyzw
          movc r7.xyz, r5.wwww, r3.ywzy, r7.xyzx
          movc r6.xyz, r5.wwww, r8.xyzx, r6.xyzx
          add r6.z, r1.w, r6.z
          mul r1.w, r1.w, l(0.500000)
          iadd r3.x, r3.x, l(1)
        endloop 
        mov r10.xyzw, r2.xyzw
        mov r5.xy, r7.xzxx
      else 
        mov r5.xy, r7.xzxx
      endif 
    else 
      sample_l r10.xyzw, r4.xyxx, t7.xyzw, s0, l(0.000000)
    endif 
  else 
    mov r10.xyzw, l(1.000000,1.000000,1.000000,1.000000)
    mov r0.x, l(0)
  endif 
  if_z r0.x
    mul r0.xyz, r1.xyzx, r4.wwww
    mad r1.xyz, -r4.wwww, r1.xyzx, r4.xyzx
    mov r7.xyz, r4.xzyx
    mov r2.xy, r6.xyxx
    mov r2.z, l(0.500000)
    mov r0.w, l(0.250000)
    mov r1.w, l(0)
    loop 
      ige r2.w, r1.w, l(8)
      breakc_nz r2.w
      mad r3.xyz, r2.zzzz, r0.xyzx, r1.xyzx
      sample_l r8.xyzw, r3.xyxx, t6.zwxy, s0, l(0.000000)
      ge r2.w, r8.z, r3.z
      mad r8.z, -r0.w, l(2.000000), r2.z
      movc r7.xyz, r2.wwww, r3.xzyx, r7.xyzx
      movc r2.xyz, r2.wwww, r8.xyzx, r2.xyzx
      add r2.z, r0.w, r2.z
      mul r0.w, r0.w, l(0.500000)
      iadd r1.w, r1.w, l(1)
    endloop 
    mov r6.xy, r2.xyxx
    mov r5.xy, r7.xzxx
  endif 
else 
  mov r10.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  mov r6.xy, l(0,0,0,0)
endif 
ge r0.x, r5.x, l(0.000000)
if_nz r0.x
  add r0.xy, r6.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
  add r0.xz, r0.xxyx, r0.xxyx
  mad r0.w, -r6.x, r6.x, l(1.000000)
  mad r0.w, -r6.y, r6.y, r0.w
  sqrt r0.w, r0.w
  mul r0.y, r0.w, l(0.500000)
  dp3 r0.w, r0.xyzx, r0.xyzx
  rsq r0.w, r0.w
  mul r0.xyz, r0.wwww, r0.xyzx
  if_nz cb0[0].y
    add r5.z, -r5.y, l(1.000000)
    mul r1.xy, r5.xzxx, cb3[0].xxxx
    sample_l r2.xyzw, r1.xyxx, t4.xyzw, s1, l(0.000000)
    sample_l r1.xyzw, r1.xyxx, t5.xyzw, s1, l(0.000000)
    mul r2.zw, r10.yyyy, r2.zzzw
    mad r2.xy, r2.xyxx, r10.xxxx, r2.zwzz
    mad r1.xy, r1.xyxx, r10.zzzz, r2.xyxx
    mad r1.xy, r1.zwzz, r10.wwww, r1.xyxx
    add r1.xy, r1.xyxx, l(-0.500000, -0.500000, 0.000000, 0.000000)
    mul r1.xy, r1.xyxx, cb2[0].wwww
    mul r1.xy, r1.xyxx, cb3[0].xxxx
    mul r1.xy, r1.xyxx, cb3[0].zzzz
    mov r1.z, -r1.x
    add r1.w, -cb3[0].z, l(1.000000)
    mul r2.xyz, r1.xwyx, l(-1.000000, 1.000000, 1.000000, 0.000000)
    dp3 r0.w, r1.zwyz, r2.xyzx
    rsq r0.w, r0.w
    mul r1.xyz, r0.wwww, r2.xyzx
    mad r1.xyz, r1.xyzx, l(0.500000, 0.500000, 0.500000, 0.000000), r0.xyzx
    dp3 r0.w, r1.xyzx, r1.xyzx
    rsq r0.w, r0.w
    mul r0.xyz, r0.wwww, r1.xyzx
  endif 
  dp3_sat r0.x, cb1[0].xyzx, r0.xyzx
  if_nz cb0[0].y
    mul r0.yz, r5.xxyx, cb3[0].xxxx
    sample_l r1.xyzw, r0.yzyy, t0.xyzw, s1, l(0.000000)
    sample_l r2.xyzw, r0.yzyy, t1.xyzw, s1, l(0.000000)
    mul r2.xyzw, r10.yyyy, r2.xyzw
    mad r1.xyzw, r1.xyzw, r10.xxxx, r2.xyzw
    sample_l r2.xyzw, r0.yzyy, t2.xyzw, s1, l(0.000000)
    mad r1.xyzw, r2.xyzw, r10.zzzz, r1.xyzw
    sample_l r2.xyzw, r0.yzyy, t3.xyzw, s1, l(0.000000)
    mad r1.xyzw, r2.xyzw, r10.wwww, r1.xyzw
  else 
    mov r1.xyzw, l(1.000000,1.000000,1.000000,1.000000)
  endif 
  if_nz cb0[0].z
    mov r7.xz, r5.xxyx
    mov r7.w, l(1.000000)
    dp4 r2.x, r7.xyzw, cb1[24].xyzw
    dp4 r2.y, r7.xyzw, cb1[25].xyzw
    dp4 r0.y, r7.xyzw, cb1[26].xyzw
    dp4 r0.z, r7.xyzw, cb1[27].xyzw
    div r2.xy, r2.xyxx, r0.zzzz
    mad r2.xy, r2.xyxx, l(0.500000, 0.500000, 0.000000, 0.000000), l(0.500000, 0.500000, 0.000000, 0.000000)
    div r0.y, r0.y, r0.z
    add r0.y, r0.y, -cb3[0].w
    add r2.z, -r2.y, l(1.000000)
    sample_c_lz r0.y, r2.xzxx, t9.xxxx, s2, r0.y
  else 
    mov r0.y, l(1.000000)
  endif 
  mul r0.x, r0.y, r0.x
  max r0.x, r0.x, l(0.100000)
  mul o0.xyzw, r0.xxxx, r1.xyzw
else 
  discard l(-1)
  mov o0.xyzw, l(0,0,0,0)
endif 
mov r7.xz, r5.xxyx
mov r7.w, l(1.000000)
dp4 r0.x, r7.xyzw, cb1[18].xyzw
dp4 r0.y, r7.xyzw, cb1[19].xyzw
div oDepth, r0.x, r0.y
ret 
// Approximately 282 instruction slots used
