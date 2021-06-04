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

import am.ik.yavi.fn.Function8;
import am.ik.yavi.fn.Validations;

/**
 * Generated by https://github.com/making/yavi/blob/develop/scripts/generate-args.sh
 *
 * @since 0.7.0
 */
public class Arguments8Splitting<A1, A2, A3, A4, A5, A6, A7, A8, R1, R2, R3, R4, R5, R6, R7, R8> {
	protected final Arguments1Validator<? super A1, ? extends R1> v1;

	protected final Arguments1Validator<? super A2, ? extends R2> v2;

	protected final Arguments1Validator<? super A3, ? extends R3> v3;

	protected final Arguments1Validator<? super A4, ? extends R4> v4;

	protected final Arguments1Validator<? super A5, ? extends R5> v5;

	protected final Arguments1Validator<? super A6, ? extends R6> v6;

	protected final Arguments1Validator<? super A7, ? extends R7> v7;

	protected final Arguments1Validator<? super A8, ? extends R8> v8;

	public Arguments8Splitting(Arguments1Validator<? super A1, ? extends R1> v1,
			Arguments1Validator<? super A2, ? extends R2> v2,
			Arguments1Validator<? super A3, ? extends R3> v3,
			Arguments1Validator<? super A4, ? extends R4> v4,
			Arguments1Validator<? super A5, ? extends R5> v5,
			Arguments1Validator<? super A6, ? extends R6> v6,
			Arguments1Validator<? super A7, ? extends R7> v7,
			Arguments1Validator<? super A8, ? extends R8> v8) {
		this.v1 = v1;
		this.v2 = v2;
		this.v3 = v3;
		this.v4 = v4;
		this.v5 = v5;
		this.v6 = v6;
		this.v7 = v7;
		this.v8 = v8;
	}

	public <X> Arguments8Validator<A1, A2, A3, A4, A5, A6, A7, A8, X> apply(
			Function8<? super R1, ? super R2, ? super R3, ? super R4, ? super R5, ? super R6, ? super R7, ? super R8, ? extends X> f) {
		return (a1, a2, a3, a4, a5, a6, a7, a8, locale, constraintGroup) -> Validations
				.apply(f::apply, this.v1.validate(a1, locale, constraintGroup),
						this.v2.validate(a2, locale, constraintGroup),
						this.v3.validate(a3, locale, constraintGroup),
						this.v4.validate(a4, locale, constraintGroup),
						this.v5.validate(a5, locale, constraintGroup),
						this.v6.validate(a6, locale, constraintGroup),
						this.v7.validate(a7, locale, constraintGroup),
						this.v8.validate(a8, locale, constraintGroup));
	}

	public <A9, R9> Arguments9Splitting<A1, A2, A3, A4, A5, A6, A7, A8, A9, R1, R2, R3, R4, R5, R6, R7, R8, R9> split(
			Arguments1Validator<? super A9, ? extends R9> v9) {
		return new Arguments9Splitting<>(v1, v2, v3, v4, v5, v6, v7, v8, v9);
	}
}
