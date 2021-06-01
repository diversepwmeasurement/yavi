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

import java.util.List;
import java.util.Locale;

import am.ik.yavi.core.CollectionValidator;
import am.ik.yavi.core.ConstraintCondition;
import am.ik.yavi.core.ConstraintGroup;
import am.ik.yavi.core.ConstraintPredicates;
import am.ik.yavi.core.ConstraintViolationsException;
import am.ik.yavi.core.Validated;
import am.ik.yavi.core.Validator;
import am.ik.yavi.core.ValidatorSubset;
import am.ik.yavi.fn.Pair;
import am.ik.yavi.fn.Function11;
import am.ik.yavi.message.MessageFormatter;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.3.0
 */
public final class Arguments11Validator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, X>
		extends Validator<Arguments11<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>> {
	private final Function11<? super A1, ? super A2, ? super A3, ? super A4, ? super A5, ? super A6, ? super A7, ? super A8, ? super A9, ? super A10, ? super A11, ? extends X> mapper;

	public Arguments11Validator(String messageKeySeparator,
			List<ConstraintPredicates<Arguments11<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>, ?>> constraintPredicates,
			List<CollectionValidator<Arguments11<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>, ?, ?>> collectionValidators,
			List<Pair<ConstraintCondition<Arguments11<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>>, ValidatorSubset<Arguments11<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>>>> conditionalValidators,
			MessageFormatter messageFormatter,
			Function11<? super A1, ? super A2, ? super A3, ? super A4, ? super A5, ? super A6, ? super A7, ? super A8, ? super A9, ? super A10, ? super A11, ? extends X> mapper) {
		super(messageKeySeparator, constraintPredicates, collectionValidators,
				conditionalValidators, messageFormatter);
		this.mapper = mapper;
	}

	public Validated<X> validateArgs(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11) {
		return this.applicative()
				.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
						Locale.getDefault(), ConstraintGroup.DEFAULT)
				.map(values -> values.map(this.mapper));
	}

	public Validated<X> validateArgs(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11, ConstraintGroup constraintGroup) {
		return this.applicative()
				.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
						Locale.getDefault(), constraintGroup)
				.map(values -> values.map(this.mapper));
	}

	public Validated<X> validateArgs(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11, Locale locale) {
		return this.applicative()
				.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
						locale, ConstraintGroup.DEFAULT)
				.map(values -> values.map(this.mapper));
	}

	public Validated<X> validateArgs(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11, Locale locale,
			ConstraintGroup constraintGroup) {
		return this.applicative()
				.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
						locale, constraintGroup)
				.map(values -> values.map(this.mapper));
	}

	public void validateAndThrowIfInvalid(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11) {
		this.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11))
				.throwIfInvalid(ConstraintViolationsException::new);
	}

	public void validateAndThrowIfInvalid(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7,
			A8 a8, A9 a9, A10 a10, A11 a11, ConstraintGroup constraintGroup) {
		this.validate(Arguments.of(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11),
				constraintGroup).throwIfInvalid(ConstraintViolationsException::new);
	}

	public X validated(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7, A8 a8, A9 a9,
			A10 a10, A11 a11) throws ConstraintViolationsException {
		return this.validateArgs(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11)
				.orElseThrow(ConstraintViolationsException::new);
	}

	public X validated(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7, A8 a8, A9 a9,
			A10 a10, A11 a11, ConstraintGroup constraintGroup)
			throws ConstraintViolationsException {
		return this.validateArgs(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11,
				constraintGroup).orElseThrow(ConstraintViolationsException::new);
	}

	public X validated(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7, A8 a8, A9 a9,
			A10 a10, A11 a11, Locale locale) throws ConstraintViolationsException {
		return this.validateArgs(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, locale)
				.orElseThrow(ConstraintViolationsException::new);
	}

	public X validated(A1 a1, A2 a2, A3 a3, A4 a4, A5 a5, A6 a6, A7 a7, A8 a8, A9 a9,
			A10 a10, A11 a11, Locale locale, ConstraintGroup constraintGroup)
			throws ConstraintViolationsException {
		return this.validateArgs(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, locale,
				constraintGroup).orElseThrow(ConstraintViolationsException::new);
	}
}
