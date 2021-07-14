/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.arguments;

import java.util.Locale;
import java.util.function.Function;

import am.ik.yavi.core.ConstraintGroup;
import am.ik.yavi.core.ConstraintViolationsException;
import am.ik.yavi.core.Validated;
import am.ik.yavi.jsr305.Nullable;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
@FunctionalInterface
public interface Arguments7Validator<A1, A2, A3, A4, A5, A6, A7, X> {

	Validated<X> validate(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale, ConstraintGroup constraintGroup);

	/**
	 * @since 0.7.0
	 */
	default <X2> Arguments7Validator<A1, A2, A3, A4, A5, A6, A7, X2> andThen(
			Function<? super X, ? extends X2> mapper) {
		return (a1, a2, a3, a4, a5, a6, a7, locale,
				constraintGroup) -> Arguments7Validator.this
						.validate(a1, a2, a3, a4, a5, a6, a7, locale, constraintGroup)
						.map(mapper);
	}

	/**
	 * @since 0.7.0
	 */
	default <A> Arguments1Validator<A, X> compose(
			Function<? super A, ? extends Arguments7<? extends A1, ? extends A2, ? extends A3, ? extends A4, ? extends A5, ? extends A6, ? extends A7>> mapper) {
		return (a, locale, constraintGroup) -> {
			final Arguments7<? extends A1, ? extends A2, ? extends A3, ? extends A4, ? extends A5, ? extends A6, ? extends A7> args = mapper
					.apply(a);
			return Arguments7Validator.this.validate(args.arg1(), args.arg2(),
					args.arg3(), args.arg4(), args.arg5(), args.arg6(), args.arg7(),
					locale, constraintGroup);
		};
	}

	default Validated<X> validate(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, Locale.getDefault(),
				ConstraintGroup.DEFAULT);
	}

	default Validated<X> validate(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			ConstraintGroup constraintGroup) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, Locale.getDefault(),
				constraintGroup);
	}

	default Validated<X> validate(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, locale, ConstraintGroup.DEFAULT);
	}

	default X validated(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7)
			throws ConstraintViolationsException {
		return this.validate(a1, a2, a3, a4, a5, a6, a7)
				.orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			ConstraintGroup constraintGroup) throws ConstraintViolationsException {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, constraintGroup)
				.orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale) throws ConstraintViolationsException {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, locale)
				.orElseThrow(ConstraintViolationsException::new);
	}

	default X validated(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale, ConstraintGroup constraintGroup)
			throws ConstraintViolationsException {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, locale, constraintGroup)
				.orElseThrow(ConstraintViolationsException::new);
	}

	/**
	 * Use {@link #validate(Object, Object, Object, Object, Object, Object, Object)}
	 * instead
	 */
	@Deprecated
	default Validated<X> validateArgs(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7);
	}

	/**
	 * Use
	 * {@link #validate(Object, Object, Object, Object, Object, Object, Object, ConstraintGroup)}
	 * instead
	 */
	@Deprecated
	default Validated<X> validateArgs(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			ConstraintGroup constraintGroup) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, constraintGroup);
	}

	/**
	 * Use
	 * {@link #validate(Object, Object, Object, Object, Object, Object, Object, Locale)}
	 * instead
	 */
	@Deprecated
	default Validated<X> validateArgs(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, locale);
	}

	/**
	 * Use
	 * {@link #validate(Object, Object, Object, Object, Object, Object, Object, Locale, ConstraintGroup)}
	 * instead
	 */
	@Deprecated
	default Validated<X> validateArgs(@Nullable A1 a1, @Nullable A2 a2, @Nullable A3 a3,
			@Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6, @Nullable A7 a7,
			Locale locale, ConstraintGroup constraintGroup) {
		return this.validate(a1, a2, a3, a4, a5, a6, a7, locale, constraintGroup);
	}

	/**
	 * Consider using
	 * {@link #validate(Object, Object, Object, Object, Object, Object, Object, ConstraintGroup)}
	 * instead
	 */
	@Deprecated
	default void validateAndThrowIfInvalid(@Nullable A1 a1, @Nullable A2 a2,
			@Nullable A3 a3, @Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6,
			@Nullable A7 a7, ConstraintGroup constraintGroup) {
		throw new UnsupportedOperationException(
				"validateAndThrowIfInvalid is not supported. Consider using validate method instead.");
	}

	/**
	 * Consider using
	 * {@link #validate(Object, Object, Object, Object, Object, Object, Object)} instead
	 */
	@Deprecated
	default void validateAndThrowIfInvalid(@Nullable A1 a1, @Nullable A2 a2,
			@Nullable A3 a3, @Nullable A4 a4, @Nullable A5 a5, @Nullable A6 a6,
			@Nullable A7 a7) {
		this.validateAndThrowIfInvalid(a1, a2, a3, a4, a5, a6, a7,
				ConstraintGroup.DEFAULT);
	}
}
