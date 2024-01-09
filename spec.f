      PROGRAM PowerSpectrumEstimation
      INTEGER N, I
      PARAMETER (N=256)
      REAL SIGNAL(N), POWER(N/2)
      COMPLEX FFTOUT(N)

      ! Initialize your signal here. 
      ! For example, let's use a simple sine wave.
      DO I = 1, N
        SIGNAL(I) = SIN(2 * 3.14159 * I / N)
      END DO

      ! Call FFT subroutine on SIGNAL, results stored in FFTOUT
      CALL FFT(SIGNAL, FFTOUT, N)

      ! Compute power spectrum
      DO I = 1, N/2
        POWER(I) = (ABS(FFTOUT(I))**2)/N
      END DO

      ! Output the power spectrum
      DO I = 1, N/2
        PRINT *, I, POWER(I)
      END DO

      END PROGRAM


      SUBROUTINE FFT(X, Y, N)
      REAL X(N)
      COMPLEX Y(N), W, TEMP
      INTEGER N, I, J, K, L, LE, LE1, IP

      ! FFT algorithm implementation
      ! This is a very basic version and for a complete and efficient implementation,
      ! it's better to use a library such as FFTPACK.

      ! Bit-reversal Permutation
      J = 1
      DO I = 1, N - 1
        IF (I .LT. J) THEN
          TEMP = CMPLX(X(J), 0.0)
          Y(J) = CMPLX(X(I), 0.0)
          Y(I) = TEMP
        END IF
        K = N / 2
      DO  WHILE (K .LT. J)
          J = J - K
          K = K / 2
        END DO
        J = J + K
      END DO

      ! Danielson-Lanczos algorithm
      L = 1
      DO WHILE (L .LT. N)
        LE = 2 * L
        LE1 = LE / 2
        W = CMPLX(COS(3.14159 / LE1), -SIN(3.14159 / LE1))
        DO J = 1, N, LE
          IP = J + LE1
          TEMP = Y(IP) * W
          Y(IP) = Y(J) - TEMP
          Y(J) = Y(J) + TEMP
        END DO
        L = LE
      END DO

      END SUBROUTINE
