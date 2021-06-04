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
package am.ik.yavi.builder;

import java.util.function.Function;

import am.ik.yavi.arguments.Arguments1;
import am.ik.yavi.arguments.LongValidator;
import am.ik.yavi.constraint.LongConstraint;
import am.ik.yavi.core.Validator;

/**
 * @since 0.7.0
 */
public class LongValidatorBuilder {
	private final String name;

	private final Function<LongConstraint<Arguments1<Long>>, LongConstraint<Arguments1<Long>>> constraints;

	public static LongValidatorBuilder of(String name,
			Function<LongConstraint<Arguments1<Long>>, LongConstraint<Arguments1<Long>>> constraints) {
		return new LongValidatorBuilder(name, constraints);
	}

	LongValidatorBuilder(String name,
			Function<LongConstraint<Arguments1<Long>>, LongConstraint<Arguments1<Long>>> constraints) {
		this.name = name;
		this.constraints = constraints;
	}

	public <T> LongValidator<T> build(Function<? super Long, ? extends T> mapper) {
		final Validator<Arguments1<Long>> validator = ValidatorBuilder
				.<Arguments1<Long>> of().constraint(Arguments1::arg1, name, constraints)
				.build();
		return new LongValidator<>(validator, mapper::apply);
	}

	public LongValidator<Long> build() {
		return build(x -> x);
	}
}
